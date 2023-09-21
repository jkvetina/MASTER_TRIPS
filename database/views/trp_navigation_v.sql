CREATE OR REPLACE FORCE VIEW trp_navigation_v AS
WITH curr AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id,
        core.get_user_id()      AS user_id
    FROM DUAL
),
y AS (
    SELECT /*+ MATERIALIZE */
        t.year_,
        ROW_NUMBER() OVER(ORDER BY t.year_ ASC) AS order#,
        COUNT(*) AS year_count,
        --
        CASE WHEN t.year_ = MIN(t.year_) OVER()
            THEN TO_NUMBER(REGEXP_SUBSTR(MIN(CASE WHEN t.start_at >= TRUNC(SYSDATE)
                THEN t.start_at || '|' || t.end_at || '|' || t.trip_id END), '\d+$'))
            END AS next_trip,
        --
        MAX(COUNT(*)) OVER()                AS max_rows,
        MAX(COUNT(*)) OVER() - COUNT(*) + 1 AS missing_rows
        --
    FROM trp_trips t
    JOIN curr
        ON curr.user_id = t.created_by
    WHERE t.year_       >= TO_CHAR(TRUNC(SYSDATE), 'YYYY')
    GROUP BY
        t.year_
)
SELECT
    n.app_id,                   -- some extra columns for FE
    n.page_id,
    n.parent_id,
    n.auth_scheme,
    n.procedure_name,
    n.label__,
    --
    n.lvl,                      -- mandatory columns for APEX navigation
    n.label,
    n.target,
    n.is_current_list_entry,
    n.image,
    n.image_attribute,
    n.image_alt_attribute,
    n.attribute01,              -- <li class="...">
    n.attribute02,              -- <li>...<a>
    n.attribute03,              -- <a class="..."
    n.attribute04,              -- <a title="..."
    n.attribute05,              -- <a ...> // javascript onclick
    n.attribute06,              -- <a>... #TEXT</a>
    n.attribute07,              -- <a>#TEXT ...</a>
    n.attribute08,              -- </a>...
    n.attribute09,
    n.attribute10,
    n.order#
FROM app_navigation_v n
CROSS JOIN curr
UNION ALL
--
SELECT                      -- append favorites
    curr.app_id,
    100                     AS page_id,
    NULL                    AS parent_id,
    NULL                    AS auth_scheme,
    NULL                    AS procedure_name,
    NULL                    AS label__,
    2                       AS lvl,
    --
    CASE
        WHEN t.end_at <= TRUNC(SYSDATE)
            THEN core.get_icon('fa-check')
            --
        WHEN t.trip_id = y.next_trip
            THEN core.get_icon('fa-arrow-right')
            --
        WHEN t.trip_name LIKE '%(?)%'
            THEN core.get_icon('fa-question')
            --
        ELSE '&' || 'mdash;'
        END || '&' || 'nbsp; ' || REGEXP_REPLACE(REPLACE(t.trip_name, ' - ', ' &' || 'ndash; '), '\s*\(\?\)\s*', '') AS label,
    --
    APEX_PAGE.GET_URL (
        p_application       => curr.app_id,
        p_page              => 100,
        p_clear_cache       => 100,
        p_items             => 'P100_TRIP_ID',
        p_values            => t.trip_id
    ) AS target,
    --
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    NULL AS attribute01,
    NULL AS attribute02,
    NULL AS attribute03,
    NULL AS attribute04,
    --
    ' style="margin: -0.3rem 0.5rem -0.3rem 2rem; font-size: 70%;"' AS attribute05,
    --
    NULL AS attribute06,
    NULL AS attribute07,
    NULL AS attribute08,
    NULL AS attribute09,
    NULL AS attribute10,
    --
    '/100.100/' || y.order# || '.' || t.year_ || '/' || LPAD(ROW_NUMBER() OVER (ORDER BY t.start_at, t.end_at, t.trip_id), 8, '0') AS order#
    --
FROM trp_trips t
JOIN curr
    ON curr.user_id     = t.created_by
JOIN y
    ON y.year_          = t.year_
UNION ALL
--
SELECT                                  -- ADD YEARS
    NULL AS app_id,
    NULL AS page_id,
    NULL AS parent_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    2    AS lvl,
    NULL AS label,
    NULL AS target,
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    --
    'NO_HOVER TRANSPARENT'              AS attribute01,
    '<span>' || y.year_ || '</span>'    AS attribute02,
    --
    NULL AS attribute03,
    NULL AS attribute04,
    NULL AS attribute05,
    NULL AS attribute06,
    NULL AS attribute07,
    NULL AS attribute08,
    --
    NULLIF((
        SELECT 'MULTI_' || COUNT(*) AS max_cols
        FROM y
    ), 'MULTI_0') AS attribute09,
    --
    NULL AS attribute10,
    --
    '/100.100/' || y.order# || '.' || y.year_ || '/' AS order#
    --
FROM y
UNION ALL
--
SELECT                                  -- ADD EXTRA ROWS TO ALIGN YEARS
    NULL AS app_id,
    NULL AS page_id,
    NULL AS parent_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    2    AS lvl,
    NULL AS label,
    NULL AS target,
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    --
    'NO_HOVER TRANSPARENT' AS attribute01,
    --
    CASE WHEN d.row_id = y.missing_rows
        THEN '<div style="height: 0; overflow: hidden; margin: 1.5rem 0 0;">&' || 'nbsp;</div>'  -- last row shorter
        ELSE '<span style="margin: -0.3rem 0.5rem -0.3rem 2rem; font-size: 70%;">&' || 'nbsp;</span>'
        END AS attribute02,
    --
    NULL AS attribute03,
    NULL AS attribute04,
    NULL AS attribute05,
    NULL AS attribute06,
    NULL AS attribute07,
    NULL AS attribute08,
    NULL AS attribute09,
    NULL AS attribute10,
    --
    '/100.100/' || y.order# || '.' || y.year_ || '/Z/' || d.row_id AS order#
    --
FROM y
JOIN (
    SELECT LEVEL AS row_id
    FROM DUAL
    CONNECT BY LEVEL <= 20      -- max 20 rows per year
) d
    ON d.row_id <= y.missing_rows;
--
COMMENT ON TABLE trp_navigation_v IS '';

