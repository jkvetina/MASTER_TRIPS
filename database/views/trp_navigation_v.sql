CREATE OR REPLACE FORCE VIEW trp_navigation_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()           AS app_id,
        core.get_user_id()          AS user_id,
        core.get_item('$TRIP_ID')   AS trip_id
    FROM DUAL
),
n AS (
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.page_id,
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
    FROM master.app_navigation_v n
),
future_years AS (
    -- columns used to divide trips
    SELECT /*+ MATERIALIZE */
        t.year_
    FROM trp_trips t
    JOIN x
        ON x.user_id    = t.created_by
    WHERE t.year_       >= TO_CHAR(TRUNC(SYSDATE), 'YYYY') - 2
    GROUP BY
        t.year_
),
future_trips AS (
    -- data to show in menu, with some flags precalculated
    SELECT /*+ MATERIALIZE */
        CASE WHEN t.trip_id = x.trip_id THEN 'Y' END AS is_current_trip,
        --
        CASE WHEN t.year_ = TO_CHAR(TRUNC(SYSDATE), 'YYYY')
                AND t.trip_name NOT LIKE '%(?)%'
                AND t.start_at = MIN(CASE WHEN t.start_at - TRUNC(SYSDATE) > 0 THEN t.start_at END) OVER ()
            THEN 'Y'
            END AS is_next_trip,
        --
        LPAD(ROW_NUMBER() OVER (PARTITION BY t.year_ ORDER BY t.start_at, t.end_at, t.trip_id), 8, '0') AS order#,
        --
        t.year_,
        t.trip_id,
        t.trip_name,
        t.end_at,
        t.start_at - TRUNC(SYSDATE) AS badge
        --
    FROM trp_trips t
    JOIN future_years y
        ON y.year_      = t.year_
    JOIN x
        ON x.user_id    = t.created_by
    GROUP BY
        t.year_,
        x.trip_id,
        t.trip_id,
        t.trip_name,
        t.start_at,
        t.end_at
),
endpoints AS (
    -- endpoints to attach dynamic stuff, make sure this returns just 1 row
    SELECT /*+ MATERIALIZE */
        MAX(CASE WHEN n.page_id = 100 THEN n.order# END) AS trips
        --
    FROM n
    JOIN x
        ON x.app_id     = n.app_id
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
FROM n
UNION ALL
--
-- MULTICOLUMN MENU WITH ICONS/FLAGS
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
    '</ul><ul>' AS attribute08,     -- start new column with each year
    '' AS attribute09,
    '' AS attribute10,
    --
    e.trips || '/' || y.year_ AS order#
    --
FROM future_years y
JOIN endpoints e
    ON e.trips IS NOT NULL
UNION ALL
--
SELECT
    2 AS lvl,
    --
    '<a href="' ||
    APEX_PAGE.GET_URL (
        p_page          => 150,
        p_clear_cache   => 150,
        p_items         => 'P150_TRIP_ID',
        p_values        => t.trip_id
    ) ||
    '" class="NAV_L3">' ||
    CASE
        WHEN t.trip_name LIKE '%(?)%'
            THEN core.get_icon('fa-question') || ' &' || 'nbsp;'
            --
        WHEN t.is_next_trip = 'Y'
            THEN core.get_icon('fa-arrow-right') || ' &' || 'nbsp;'
            --
        WHEN t.end_at <= TRUNC(SYSDATE)
            THEN core.get_icon('fa-check') || ' &' || 'nbsp;'
            --
        ELSE
            '<span>&' || 'mdash; &' || 'nbsp;</span>'
        END ||
    '<span>' || LTRIM(REGEXP_REPLACE(REPLACE(t.trip_name, ' - ', ' &' || '' || 'ndash; '), '\s*\(\?\)\s*', '')) || '</span>' ||
    CASE
        WHEN t.is_next_trip = 'Y'
            THEN '<span class="BADGE">' || t.badge || '</span>'
        END ||
    '</a>' AS attribute01,
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
    CASE WHEN t.is_current_trip = 'Y' THEN ' class="ACTIVE"' END AS attribute10,
    --
    e.trips || '/' || t.year_ || '/' || t.order# AS order#
    --
FROM future_trips t
JOIN endpoints e
    ON e.trips IS NOT NULL;
/

