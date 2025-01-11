CREATE OR REPLACE PACKAGE BODY trp_app as

    PROCEDURE init_p100
    AS
    BEGIN
        IF core.get_item('$YEAR') IS NULL THEN
            core.set_item('$YEAR', TO_CHAR(TRUNC(SYSDATE), 'YYYY'));
        END IF;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE init_p105
    AS
    BEGIN
        core.set_item('$GPS_BUTTON',
            master.app.get_item_button (
                in_icon     => 'fa-ai-microchip',
                in_link     => '',
                in_function => 'get_gps_coordinates()',
                in_title    => 'Get GPS Coordinates'
            )
        );

        -- trip related items
        FOR c IN (
            SELECT
                TO_CHAR(MIN(t.start_at), 'YYYY-MM-DD') AS trip_start_at,
                --
                CASE WHEN core.get_number_item('$TRIP_ID') IS NULL
                THEN 'Create Trip'
                ELSE 'Update Trip' END AS header_
                --
            FROM trp_trips t
            WHERE t.trip_id = core.get_number_item('$TRIP_ID')
        ) LOOP
            core.set_item('$HEADER', c.header_);
            core.set_item('$SUBMIT', c.header_);
        END LOOP;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE init_p150
    AS
        in_trip_id              CONSTANT trp_trips.trip_id%TYPE := core.get_number_item('$TRIP_ID');
        --
        v_recent_trip_id        trp_trips.trip_id%TYPE;
        v_trip_header           VARCHAR2(256);
        v_itinerary_header      VARCHAR2(256);
        v_today                 DATE;
    BEGIN
        -- redirect to recent trip
        IF in_trip_id IS NULL AND INSTR(core.get_request_url(), 'clear=150') = 0 THEN
            v_recent_trip_id := APEX_UTIL.GET_PREFERENCE (
                p_preference    => 'RECENT_TRIP',
                p_user          => core.get_user_id()
            );
            --
            IF v_recent_trip_id IS NOT NULL THEN
                core.redirect (
                    in_page_id      => 150,
                    in_names        => 'P150_TRIP_ID',
                    in_values       => v_recent_trip_id,
                    in_reset        => 'Y'
                );
                RETURN; -- we will be redirecting anyway
            END IF;
        END IF;

        -- prefill default values
        v_today := core.get_date_item('$DAY');
        --
        FOR c IN (
            SELECT
                t.trip_id,
                t.trip_name,
                t.start_at,
                t.end_at + 1    AS end_at,
                SUM(price)      AS price
                --
            FROM trp_trips t
            LEFT JOIN trp_itinerary i
                ON i.trip_id    = t.trip_id
                AND (i.start_at >= v_today      OR v_today IS NULL)
                AND (i.end_at   < v_today + 1   OR v_today IS NULL OR i.end_at IS NULL)
            WHERE t.trip_id     = in_trip_id
            GROUP BY
                t.trip_id,
                t.trip_name,
                t.start_at,
                t.end_at + 1
        ) LOOP
            core.set_item('$TRIP_HEADER',   c.trip_name);
            core.set_item('$TRIP_START',    TO_CHAR(c.start_at, 'YYYY-MM-DD'));
            core.set_item('$TRIP_END',      TO_CHAR(c.end_at,   'YYYY-MM-DD'));
            --
            v_trip_header := c.trip_name ||
                CASE WHEN c.price > 0 THEN '<span class="BADGE GREY" style="margin-right: 1rem;">' || CEIL(c.price / 1000) || 'k</span>' END;
            --
            v_itinerary_header := RTRIM('Itinerary - ' || core.get_item('$DAY'), ' - ');
        END LOOP;
        --
        core.set_item('$TRIP_HEADER',       REPLACE(v_trip_header,      ' - ', ' &' || 'ndash; '));
        core.set_item('$ITINERARY_HEADER',  REPLACE(v_itinerary_header, ' - ', ' &' || 'ndash; '));
        core.set_item('$RECENT_TRIP_URL',   '');

        -- store current trip for redirection after login
        IF in_trip_id IS NOT NULL THEN
            APEX_UTIL.SET_PREFERENCE (
                p_preference    => 'RECENT_TRIP',
                p_value         => in_trip_id,
                p_user          => core.get_user_id()
            );
        END IF;
        --
        set_days();
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN APEX_APPLICATION.E_STOP_APEX_ENGINE THEN
        NULL;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE init_p155
    AS
        v_next_stop     trp_itinerary_grid_v.stop_id%TYPE;
        v_prev_stop     trp_itinerary_grid_v.stop_id%TYPE;
        v_json          VARCHAR2(4000);
    BEGIN
        -- links to prev/next stops
        BEGIN
            SELECT t.stop_id
            INTO v_next_stop
            FROM trp_itinerary_grid_v t
            WHERE t.r# = (SELECT r# FROM trp_itinerary_grid_v WHERE stop_id = core.get_number_item('$STOP_ID')) + 1;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        END;
        --
        BEGIN
            SELECT t.stop_id
            INTO v_prev_stop
            FROM trp_itinerary_grid_v t
            WHERE t.r# = (SELECT r# FROM trp_itinerary_grid_v WHERE stop_id = core.get_number_item('$STOP_ID')) - 1;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        END;
        --
        core.set_item('$NEXT_STOP', v_next_stop);
        core.set_item('$PREV_STOP', v_prev_stop);
        --
        core.set_item('$GPS_BUTTON',
            master.app.get_item_button (
                in_icon     => 'fa-ai-microchip',
                in_link     => '',
                in_function => 'get_gps_coordinates()',
                in_title    => 'Get GPS Coordinates'
            )
        );

        -- stop related items
        FOR c IN (
            SELECT
                CASE
                    WHEN t.is_paid      = 'Y' THEN 'PAID'
                    WHEN t.is_reserved  = 'Y' THEN 'RESERVED'
                    WHEN t.is_pending   = 'Y' THEN 'PENDING'
                    END AS stop_status,
                --
                CASE WHEN t.link_event IS NOT NULL
                    THEN master.app.get_item_button (
                        in_icon     => 'fa-anchor',
                        in_link     => t.link_event,
                        in_title    => 'Open link'
                    )
                    END AS event_button,
                --
                CASE WHEN t.link_reservation IS NOT NULL
                    THEN master.app.get_item_button (
                        in_icon     => 'fa-anchor',
                        in_link     => t.link_reservation,
                        in_title    => 'Open link'
                    )
                    END AS reserv_button
                --
            FROM trp_itinerary t
            WHERE t.trip_id     = core.get_number_item('$TRIP_ID')
                AND t.stop_id   = core.get_number_item('$STOP_ID')
        ) LOOP
            core.set_item('$STOP_STATUS',       c.stop_status);
            core.set_item('$EVENT_BUTTON',      c.event_button);
            core.set_item('$RESERV_BUTTON',     c.reserv_button);
        END LOOP;

        -- trip related items
        FOR c IN (
            SELECT
                TO_CHAR(MIN(t.start_at), 'YYYY-MM-DD') AS trip_start_at,
                --
                CASE WHEN core.get_number_item('$STOP_ID') IS NULL
                THEN 'Create Stop'
                ELSE 'Update Stop' END AS header_,
                --
                MIN(t.country_name) AS country_name
                --
            FROM trp_trips t
            WHERE t.trip_id = core.get_number_item('$TRIP_ID')
        ) LOOP
            core.set_item('$HEADER',        c.header_);
            core.set_item('$SUBMIT',        c.header_);
            core.set_item('$TRIP_START_AT', c.trip_start_at);
            core.set_item('$COUNTRY_ID',    c.country_name);
        END LOOP;

        -- colors
        FOR c IN (
            SELECT JSON_ARRAY(JSON_OBJECTAGG (
                    KEY t.status_id VALUE t.color
                )) AS json_
            FROM trp_lov_stop_statuses_v t
        ) LOOP
            core.set_item('$STOP_STATUS_JSON', c.json_);
        END LOOP;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE save_trips
    AS
        rec                 trp_trips%ROWTYPE;
        in_action           CONSTANT CHAR := COALESCE(core.get_grid_action(), SUBSTR(core.get_request(), 1, 1));
    BEGIN
        -- change record in table
        IF core.get_page_id() = 105 THEN
            rec.trip_id         := core.get_number_item('$TRIP_ID');
            rec.trip_name       := core.get_item('$TRIP_NAME');
            rec.start_at        := core.get_date_item('$START_AT');
            rec.end_at          := core.get_date_item('$END_AT');
            rec.gps_lat         := core.get_number_item('$GPS_LAT');
            rec.gps_long        := core.get_number_item('$GPS_LONG');
        ELSE
            rec.trip_id         := core.get_grid_data('TRIP_ID');
            rec.trip_name       := core.get_grid_data('TRIP_NAME');
            rec.start_at        := core.get_date(core.get_grid_data('START_AT'));
            rec.end_at          := core.get_date(core.get_grid_data('END_AT'));
            rec.gps_lat         := core.get_grid_data('GPS_LAT');
            rec.gps_long        := core.get_grid_data('GPS_LONG');
        END IF;
        --
        trp_tapi.save_trips (rec,
            in_action           => in_action,
            in_trip_id          => NVL(core.get_grid_data('OLD_TRIP_ID'), rec.trip_id)
        );
        --
        IF in_action = 'D' THEN
            RETURN;     -- exit this procedure
        END IF;

        -- update primary key back to APEX grid for proper row refresh
        IF core.get_page_id() = 105 THEN
            core.set_item('$TRIP_ID', rec.trip_id);
        ELSE
            core.set_grid_data('OLD_TRIP_ID',       rec.trip_id);
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE save_itinerary
    AS
        rec                 trp_itinerary%ROWTYPE;
        in_action           CONSTANT CHAR := COALESCE(core.get_grid_action(), SUBSTR(core.get_request(), 1, 1));
    BEGIN
        -- change record in table
        IF core.get_page_id() = 155 THEN
            rec.trip_id         := core.get_number_item('$TRIP_ID');
            rec.stop_id         := core.get_number_item('$STOP_ID');
            rec.stop_name       := core.get_item('$STOP_NAME');
            rec.category_id     := core.get_item('$CATEGORY_ID');
            rec.price           := core.get_number_item('$PRICE');
            rec.notes           := core.get_item('$NOTES');
            rec.color_fill      := core.get_item('$COLOR_FILL');
            rec.link_reservation := core.get_item('$LINK_RESERVATION');
            rec.link_event      := core.get_item('$LINK_EVENT');
            --
            rec.is_reserved     := NULLIF(COALESCE(CASE WHEN core.get_item('$STOP_STATUS') = 'RESERVED' THEN 'Y' END, core.get_item('$IS_RESERVED')),  'N');
            rec.is_paid         := NULLIF(COALESCE(CASE WHEN core.get_item('$STOP_STATUS') = 'PAID'     THEN 'Y' END, core.get_item('$IS_PAID')),      'N');
            rec.is_pending      := NULLIF(COALESCE(CASE WHEN core.get_item('$STOP_STATUS') = 'PENDING'  THEN 'Y' END, core.get_item('$IS_PENDING')),   'N');
            --
            rec.start_at        := core.get_date_item('$START_AT');
            rec.end_at          := core.get_date_item('$END_AT');
            rec.gps_lat         := core.get_number_item('$GPS_LAT');
            rec.gps_long        := core.get_number_item('$GPS_LONG');
        ELSE
            rec.trip_id         := core.get_grid_data('TRIP_ID');
            rec.stop_id         := core.get_grid_data('STOP_ID');
            rec.stop_name       := core.get_grid_data('STOP_NAME');
            rec.category_id     := core.get_grid_data('CATEGORY_ID');
            rec.price           := core.get_grid_data('PRICE');
            rec.notes           := core.get_grid_data('NOTES');
            rec.color_fill      := core.get_grid_data('COLOR_FILL');
            rec.link_reservation := core.get_grid_data('LINK_RESERVATION');
            rec.link_event      := core.get_grid_data('LINK_EVENT');
            --
            rec.is_reserved     := core.get_grid_data('IS_RESERVED');
            rec.is_paid         := core.get_grid_data('IS_PAID');
            rec.is_pending      := core.get_grid_data('IS_PENDING');
            --
            rec.start_at        := core.get_date(core.get_grid_data('START_AT'));
            rec.end_at          := core.get_date(core.get_grid_data('END_AT'));
            rec.gps_lat         := core.get_grid_data('GPS_LAT');
            rec.gps_long        := core.get_grid_data('GPS_LONG');
        END IF;

        -- duplicate entry
        IF core.get_request() = 'CREATE_AS_NEW_STOP' THEN
            rec.stop_id         := NULL;
            --
            trp_tapi.save_itinerary (rec,
                in_action       => in_action,
                in_trip_id      => rec.trip_id,
                in_stop_id      => rec.stop_id
            );
        ELSE
            trp_tapi.save_itinerary (rec,
                in_action       => in_action,
                in_trip_id      => NVL(core.get_grid_data('OLD_TRIP_ID'), rec.trip_id),
                in_stop_id      => NVL(core.get_grid_data('OLD_STOP_ID'), rec.stop_id)
            );
        END IF;
        --
        IF in_action = 'D' THEN
            RETURN;     -- exit this procedure
        END IF;

        -- update primary key back to APEX grid for proper row refresh
        IF core.get_page_id() = 155 THEN
            core.set_item('$TRIP_ID', rec.trip_id);
            core.set_item('$STOP_ID', rec.stop_id);
        ELSE
            core.set_grid_data('OLD_TRIP_ID', rec.trip_id);
            core.set_grid_data('OLD_STOP_ID', rec.stop_id);
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE set_days
    AS
        v_day               DATE := core.get_date_item('$DAY', 'YYYY-MM-DD');
        v_day_prev          DATE;
        v_day_next          DATE;
        v_day_prev_limit    DATE;
        v_day_next_limit    DATE;
    BEGIN
        -- get boundaries
        SELECT MIN(t.start_at), MAX(t.end_at)
        INTO v_day_prev_limit, v_day_next_limit
        FROM trp_trips t
        WHERE t.trip_id     = core.get_item('$TRIP_ID');

        -- set starting date
        IF v_day IS NULL THEN
            --v_day := v_day_prev_limit;
            NULL;
        END IF;

        -- check boundaries
        v_day := LEAST(GREATEST(v_day, v_day_prev_limit), v_day_next_limit);

        -- calculate prev/next dates
        v_day_prev := v_day - 1;
        IF v_day_prev < v_day_prev_limit THEN
            v_day_prev := NULL;
        END IF;
        IF v_day_prev IS NULL AND v_day IS NULL THEN
            v_day_prev := v_day_prev_limit;
        END IF;
        --
        v_day_next := v_day + 1;
        IF v_day_next > v_day_next_limit THEN
            v_day_next := NULL;
        END IF;

        -- set items
        core.set_item('$DAY',       CASE WHEN v_day       IS NOT NULL THEN core.get_date(v_day,       'YYYY-MM-DD') END);
        core.set_item('$DAY_PREV',  CASE WHEN v_day_prev  IS NOT NULL THEN core.get_date(v_day_prev,  'YYYY-MM-DD') END);
        core.set_item('$DAY_NEXT',  CASE WHEN v_day_next  IS NOT NULL THEN core.get_date(v_day_next,  'YYYY-MM-DD') END);
        --
        core.set_item('$DAY_ATTR',      CASE WHEN v_day       IS NULL THEN ' disabled="disabled"' END);
        core.set_item('$DAY_PREV_ATTR', CASE WHEN v_day_prev  IS NULL THEN ' disabled="disabled"' END);
        core.set_item('$DAY_NEXT_ATTR', CASE WHEN v_day_next  IS NULL THEN ' disabled="disabled"' END);
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION set_colors
    RETURN CLOB
    AS
        l_result        CLOB := '';
    BEGIN
        FOR c IN (
            SELECT
                t.status_id,
                t.color_bg
            FROM master.app_lovs t
            WHERE t.app_id      = core.get_app_id()
                AND t.lov_id    = 'STATUS_TRIP'
                AND t.color_bg IS NOT NULL
        ) LOOP
            l_result := l_result || '.' || c.status_id || ' { fill: ' || c.color_bg || '; }' || CHR(10);
        END LOOP;
        --
        FOR c IN (
            SELECT
                t.category_id,
                t.color_fill
            FROM trp_lov_categories_v t
            WHERE t.color_fill IS NOT NULL
        ) LOOP
            l_result := l_result || '.CATEGORY_' || c.category_id || ' { fill: ' || c.color_fill || '; }' || CHR(10);
        END LOOP;
        --
        FOR c IN (
            SELECT DISTINCT
                t.color_fill
            FROM trp_itinerary_grid_v t
            WHERE t.color_fill IS NOT NULL
        ) LOOP
            l_result := l_result || '.COLOR_' || LTRIM(c.color_fill, '#') || ' { fill: ' || c.color_fill || '; }' || CHR(10);
        END LOOP;
        --
        RETURN TO_CLOB('<style>') || l_result || TO_CLOB('</style>');
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE get_gps_coords_from_ai (
        in_location         VARCHAR2,
        in_country          VARCHAR2
    )
    AS
        in_model            VARCHAR2(256)   := 'gpt-4o-mini';
        --
        v_response          CLOB;
        v_result            VARCHAR2(256);
        v_tokens            PLS_INTEGER;
    BEGIN
        APEX_WEB_SERVICE.SET_REQUEST_HEADERS (
            p_name_01           => 'Content-Type',
            p_value_01          => 'application/json',
            p_reset             => TRUE,
            p_skip_if_exists    => TRUE
        );
        --
        v_response := APEX_WEB_SERVICE.MAKE_REST_REQUEST (
            p_url           => 'https://api.openai.com/v1/chat/completions',
            p_http_method   => 'POST',
            p_body          => TO_CLOB(APEX_STRING.FORMAT(
                q'!{
                  !    "model"              : "%3",
                  !    "messages": [
                  !        {
                  !            "role"       : "user",
                  !            "content"    : "Give me GPS coordinates for: %1 IN %2 country as a JSON object, no explanations, just the coords."
                  !        }
                  !    ],
                  !    "temperature"        : 1,
                  !    "top_p"              : 1,
                  !    "n"                  : 1,
                  !    "stream"             : false,
                  !    "max_tokens"         : 250,
                  !    "presence_penalty"   : 0,
                  !    "frequency_penalty"  : 0
                  !}
                  !',
                p1          => SUBSTR(in_location, 1, 128),   -- limit input
                p2          => SUBSTR(in_country,  1, 128),   -- limit input
                p3          => in_model,
                p_prefix    => '!'
            )),
            p_transfer_timeout      => 10,
            p_credential_static_id  => 'JAN_OPENAI'
        );
        --
        DBMS_OUTPUT.PUT_LINE('--');
        DBMS_OUTPUT.PUT_LINE(v_response);
        DBMS_OUTPUT.PUT_LINE('--');

        -- get the response we seek
        v_result := JSON_VALUE(v_response, '$.choices[0].message.content');
        v_result := REPLACE(REPLACE(v_result, '```json', ''), '```', '');
        --
        HTP.P(v_result);

        -- show price of the request (in tokens)
        v_tokens := JSON_VALUE(v_response, '$.usage.total_tokens');
        --
        DBMS_OUTPUT.PUT_LINE('TOKENS: ' || v_tokens);
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE get_gps_coords_from_web (
        in_event_link       VARCHAR2
    )
    AS
        l_clob              CLOB;
        l_result            VARCHAR2(32767);
    BEGIN
        APEX_WEB_SERVICE.SET_REQUEST_HEADERS (
            p_name_01           => 'Content-Type',
            p_value_01          => 'text/html',
            p_name_02           => 'User-Agent',
            p_value_02          => 'Godzilla',
            p_reset             => TRUE,
            p_skip_if_exists    => TRUE
        );
        --
        --APEX_WEB_SERVICE.G_REQUEST_COOKIES := NULL;
        --
        l_clob := APEX_WEB_SERVICE.MAKE_REST_REQUEST(
            p_url           => in_event_link,
            p_http_method   => 'GET'
        );
        --
        --l_result := REGEXP_SUBSTR(l_clob, 'href="https://maps\.google\.com/\?q=@([\d\.,]+)"', 1, 1, NULL, 1);
        l_result := REGEXP_SUBSTR(l_clob, 'https://maps.google.com/');

        DBMS_OUTPUT.PUT_LINE(l_clob);
        DBMS_OUTPUT.PUT_LINE(LENGTH(l_clob));

        DBMS_OUTPUT.PUT_LINE('{"msg":"' || l_result || '"}');
        --HTP.P('{"msg":"' || l_result || '"}');

        --
        -- href="https://maps.google.com/?q=@69.64868927001953,18.962167739868164"
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        -- cleanup
        --IF DBMS_LOB.ISTEMPORARY(l_clob) THEN
        --    DBMS_LOB.FREETEMPORARY(l_clob);
        --END IF;
        --
        core.raise_error();
    END;



    PROCEDURE get_gps_coords
    AS
    BEGIN
        --IF in_event_link IS NOT NULL THEN
        --    get_gps_coords_from_web (
        --        in_event_link => in_event_link
        --    );
        --ELSE
        IF core.get_page_id() = 155 THEN
            get_gps_coords_from_ai (
                in_location     => core.get_item('$STOP_NAME'),
                in_country      => core.get_item('$COUNTRY_ID')
            );
        ELSIF core.get_page_id() = 105 THEN
            get_gps_coords_from_ai (
                in_location     => core.get_item('$TRIP_NAME'),
                in_country      => core.get_item('$COUNTRY_ID')
            );
        END IF;
        --END IF;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;

END;
/

