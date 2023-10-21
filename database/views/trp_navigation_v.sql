CREATE OR REPLACE FORCE VIEW trp_navigation_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()           AS app_id,
        core.get_user_id()          AS user_id,
        core.get_item('$TRIP_ID')   AS trip_id
    FROM DUAL
),
future_years AS (
    SELECT /*+ MATERIALIZE */
        t.year_,
        CASE WHEN t.year_ = TO_CHAR(TRUNC(SYSDATE), 'YYYY')
            THEN MIN(CASE WHEN t.end_at > TRUNC(SYSDATE) THEN t.trip_id END) KEEP (DENSE_RANK FIRST ORDER BY t.start_at DESC)
            END AS next_trip,
        --
        x.app_id
    FROM trp_trips t
    JOIN x
        ON x.user_id    = t.created_by
    WHERE t.year_       >= TO_CHAR(TRUNC(SYSDATE), 'YYYY')
    GROUP BY
        t.year_,
        x.app_id
),
home AS (
    SELECT /*+ MATERIALIZE */
        n.order#
    FROM app_navigation_v n
    JOIN x
        ON x.app_id     = n.app_id
        AND n.page_id   = 100
)
--
SELECT
    n.lvl,                  -- use Master application navigation
    n.attribute01,
    n.attribute02,
    n.attribute03,
    n.attribute04,
    n.attribute05,
    n.attribute06,
    n.attribute07,
    n.attribute08,
    n.attribute09,
    n.attribute10,
    n.order#
FROM app_navigation_v n
UNION ALL
--
-- CLASSIC MENU
--
SELECT
    1 AS lvl,
    --
    '<a href="' ||
    APEX_PAGE.GET_URL (
        p_application   => y.app_id,
        p_page          => 100,
        p_clear_cache   => 100,
        p_items         => 'P100_YEAR',
        p_values        => y.year_
    ) ||
    '"><span>' || y.year_ || '</span></a>' AS attribute01,
    --
    '' AS attribute02,
    '' AS attribute03,
    '' AS attribute04,
    '' AS attribute05,
    '' AS attribute06,
    '' AS attribute07,
    '' AS attribute08,
    '' AS attribute09,
    '' AS attribute10,
    --
    '/0.100.' || y.year_ AS order#
    --
FROM future_years y
UNION ALL
--
SELECT
    2 AS lvl,
    --
    '<a href="' ||
    APEX_PAGE.GET_URL (
        p_application   => x.app_id,
        p_page          => 100,
        p_clear_cache   => 100,
        p_items         => 'P100_TRIP_ID',
        p_values        => t.trip_id
    ) ||
    '"><span>' || t.trip_name || '</span></a>' AS attribute01,
    --
    '' AS attribute02,
    '' AS attribute03,
    '' AS attribute04,
    '' AS attribute05,
    '' AS attribute06,
    '' AS attribute07,
    '' AS attribute08,
    '' AS attribute09,
    --
    CASE WHEN t.trip_id = x.trip_id THEN ' class="ACTIVE"' END AS attribute10,
    --
    '/0.100.' || t.year_ || '/' || LPAD(ROW_NUMBER() OVER (ORDER BY t.start_at, t.end_at, t.trip_id), 8, '0') AS order#
    --
FROM trp_trips t
JOIN x
    ON x.user_id    = t.created_by
WHERE t.year_       >= TO_CHAR(TRUNC(SYSDATE), 'YYYY')
UNION ALL
--
-- ONE MENU
--
SELECT
    2 AS lvl,
    --
    '<span class="NAV_L2">' || y.year_ || '</span>' AS attribute01,
    --
    '' AS attribute02,
    '' AS attribute03,
    '' AS attribute04,
    '' AS attribute05,
    '' AS attribute06,
    '' AS attribute07,
    '' AS attribute08,
    '' AS attribute09,
    '' AS attribute10,
    --
    home.order# || '/' || y.year_ AS order#
    --
FROM future_years y
CROSS JOIN home
UNION ALL
--
SELECT
    2 AS lvl,
    --
    '<a href="' ||
    APEX_PAGE.GET_URL (
        p_page          => 100,
        p_clear_cache   => 100,
        p_items         => 'P100_TRIP_ID',
        p_values        => t.trip_id
    ) ||
    '" class="NAV_L3">' ||
    CASE
        WHEN t.end_at <= TRUNC(SYSDATE)
            THEN core.get_icon('fa-check') || ' &nbsp;'
            --
        WHEN t.trip_id = y.next_trip
            THEN core.get_icon('fa-arrow-right') || ' &nbsp;'
            --
        WHEN t.trip_name LIKE '%(?)%'
            THEN core.get_icon('fa-question') || ' &nbsp;'
        ELSE
            '<span>&mdash; &nbsp;</span>'
        END ||
    '<span>' || REGEXP_REPLACE(REPLACE(t.trip_name, ' - ', ' &' || 'ndash; '), '\s*\(\?\)\s*', '') || '</span></a>' AS attribute01,
    --
    '' AS attribute02,
    '' AS attribute03,
    '' AS attribute04,
    '' AS attribute05,
    '' AS attribute06,
    '' AS attribute07,
    '' AS attribute08,
    --
    CASE WHEN ROW_NUMBER() OVER (PARTITION BY t.year_ ORDER BY t.start_at, t.end_at, t.trip_id) = COUNT(t.trip_id) OVER (PARTITION BY t.year_)
        THEN '</ul><ul>'
        END AS attribute09,
    --
    CASE WHEN t.trip_id = x.trip_id THEN ' class="ACTIVE"' END AS attribute10,
    --
    home.order# || '/' || t.year_ || '/' || LPAD(ROW_NUMBER() OVER (PARTITION BY t.year_ ORDER BY t.start_at, t.end_at, t.trip_id), 8, '0') AS order#
    --
FROM trp_trips t
JOIN future_years y
    ON y.year_      = t.year_
CROSS JOIN home
JOIN x
    ON x.user_id    = t.created_by
WHERE t.year_       >= TO_CHAR(TRUNC(SYSDATE), 'YYYY');
--
COMMENT ON TABLE trp_navigation_v IS '';

