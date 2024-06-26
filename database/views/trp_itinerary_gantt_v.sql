CREATE OR REPLACE FORCE VIEW trp_itinerary_gantt_v AS
WITH d AS (
    SELECT /*+ MATERIALIZE */
        t.trip_id,
        --
        CASE WHEN core.get_item('$DAY') IS NULL
            THEN t.start_at
            ELSE g.gantt_start_date
            END AS gantt_start_date,
        --
        CASE WHEN core.get_item('$DAY') IS NULL
            THEN t.end_at
            ELSE g.gantt_end_date
            END + 1 AS gantt_end_date,
        --
        core.get_item('$STATUS') AS status
        --
    FROM trp_trips t
    JOIN (
        SELECT
            t.trip_id,
            MIN(TO_DATE(t.day_, 'YYYY-MM-DD')) AS gantt_start_date,
            MAX(TO_DATE(t.day_, 'YYYY-MM-DD')) AS gantt_end_date
        FROM trp_itinerary_grid_v t
        GROUP BY t.trip_id
    ) g
        ON g.trip_id        = t.trip_id
    WHERE t.trip_id         = core.get_number_item('$TRIP_ID')
        AND t.created_by    = core.get_user_id()
),
t AS (
    SELECT /*+ MATERIALIZE */
        t.trip_id,
        t.stop_id,
        t.stop_name,
        t.category_id,
        c.category_name,
        t.price,
        t.start_at,
        t.end_at,
        t.notes,
        d.gantt_start_date,
        d.gantt_end_date,
        t.color_fill,
        d.status,
        t.is_paid,
        t.is_reserved,
        t.is_pending,
        c.order#
    FROM trp_itinerary_grid_v t
    JOIN trp_lov_categories_v c
        ON c.category_id = t.category_id
    JOIN d
        ON d.trip_id    = t.trip_id
    WHERE c.order#      IS NOT NULL
)
SELECT
    d.trip_id,
    NULL                AS row_id,
    c.order#            AS stop_id,
    c.category_name     AS stop_name,
    c.category_name,
    NULL                AS price,
    NULL                AS start_at,
    NULL                AS end_at,
    NULL                AS baseline_start_at,
    NULL                AS baseline_end_at,
    NULL                AS notes,
    d.gantt_start_date,
    d.gantt_end_date,
    NULL                AS css_class,
    c.order#
FROM trp_lov_categories_v c
CROSS JOIN d
WHERE c.category_id IN (
    SELECT t.category_id
    FROM t
)
UNION ALL
SELECT
    t.trip_id,
    t.order#            AS row_id,
    t.stop_id,
    t.stop_name,
    t.category_name,
    t.price,
    t.start_at,
    t.end_at,
    CASE WHEN t.category_id = 'AIRPLANE' AND t.status IS NULL THEN (t.start_at - 2/24) END   AS baseline_start_at,
    CASE WHEN t.category_id = 'AIRPLANE' AND t.status IS NULL THEN (t.end_at + 20/1440) END  AS baseline_end_at,
    t.notes,
    t.gantt_start_date,
    t.gantt_end_date,
    --
    'STATUS_DEFAULT' ||
        CASE WHEN t.status = 'PAID' THEN
            CASE
                WHEN t.is_paid      = 'Y' THEN  ' STATUS_PAID'
                WHEN t.is_reserved  = 'Y' THEN  ' STATUS_RESERVED'
                WHEN t.is_pending   = 'Y' THEN  ' STATUS_PENDING'
                ELSE                            ' STATUS_UNKNOWN'
            END
        ELSE NULLIF(' CATEGORY_' || t.category_id, ' CATEGORY_') ||
             NULLIF(' COLOR_' || LTRIM(t.color_fill, '#'), ' COLOR_')
        END AS css_class,
    t.order#
    --
FROM t
ORDER BY row_id NULLS FIRST, start_at;
/

