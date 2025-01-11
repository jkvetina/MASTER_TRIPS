CREATE OR REPLACE FORCE VIEW trp_itinerary_grid_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        t.trip_id,
        core.get_item('$DAY') AS day_
    FROM trp_trips t
    WHERE t.trip_id         = core.get_number_item('$TRIP_ID')
        AND t.created_by    = core.get_user_id()
),
filter_days AS (
    SELECT /*+ MATERIALIZE */
        t.trip_id,
        t.day_,
        ROW_NUMBER() OVER (PARTITION BY trip_id ORDER BY day_) AS day#
    FROM (
        SELECT
            t.trip_id,
            TO_CHAR(TRUNC(t.start_at), 'YYYY-MM-DD') AS day_
        FROM trp_itinerary t
        JOIN x
            ON x.trip_id = t.trip_id
        GROUP BY
            t.trip_id,
            TO_CHAR(TRUNC(t.start_at), 'YYYY-MM-DD')
    ) t
)
SELECT
    t.trip_id       AS old_trip_id,
    t.stop_id       AS old_stop_id,
    --
    t.trip_id,
    t.stop_id,
    t.stop_name,
    t.category_id,
    t.price,
    t.link_reservation,
    t.link_event,
    t.is_reserved,
    t.is_paid,
    t.is_pending,
    --
    t.start_at,
    t.end_at,
    t.notes,
    t.color_fill,
    t.gps_lat,
    t.gps_long,
    --
    CASE WHEN t.start_at IS NULL THEN 0 ELSE r.day# END AS day#,
    r.day_,
    --
    ROW_NUMBER() OVER (ORDER BY t.start_at) AS r#
    --
FROM trp_itinerary t
JOIN x
    ON x.trip_id    = t.trip_id
JOIN filter_days r
    ON (r.day_      = TO_CHAR(TRUNC(t.start_at), 'YYYY-MM-DD') OR t.start_at IS NULL)
WHERE 1 = 1
    AND (r.day_     = x.day_ OR x.day_ IS NULL);
/

