CREATE OR REPLACE FORCE VIEW trp_navigation_v AS
WITH curr AS (
    -- current context
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id,
        core.get_user_id()      AS user_id
    FROM DUAL
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
UNION ALL
--
SELECT                      -- append favorite boards
    curr.app_id             AS page_id,
    NULL AS page_id,
    NULL AS parent_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    --
    2 AS lvl,
    REPLACE(t.trip_name, ' - ', ' &' || 'ndash; ') AS label,
    --
    APEX_PAGE.GET_URL (
        p_application       => curr.app_id,
        p_page              => 100,--curr.page_id,
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
    NULL AS attribute05,
    --'<span class="fa fa-heart-o"></span> &' || 'nbsp;'
    NULL AS attribute06,
    NULL AS attribute07,
    NULL AS attribute08,
    NULL AS attribute09,
    NULL AS attribute10,
    --
    '/100.100/' || LPAD(ROW_NUMBER() OVER (ORDER BY t.start_at, t.end_at, t.trip_id), 8, '0') AS order#
    --
FROM trp_trips t
JOIN curr
    ON curr.user_id     = t.created_by;
--
COMMENT ON TABLE trp_navigation_v IS '';

