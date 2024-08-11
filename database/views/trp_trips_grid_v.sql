CREATE OR REPLACE FORCE VIEW trp_trips_grid_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_item('$YEAR') AS year_
    FROM DUAL
)
SELECT
    t.trip_id       AS old_trip_id,
    --
    t.trip_id,
    t.trip_name,
    t.start_at,
    t.end_at,
    t.created_by,
    t.created_at,
    t.year_,
    t.gps_lat,
    t.gps_long,
    --
    CASE
        WHEN t.start_at - TRUNC(SYSDATE) >= 0
        THEN t.start_at - TRUNC(SYSDATE)
        END AS badge_days,
    --
    CASE
        WHEN t.start_at - TRUNC(SYSDATE) = MIN(CASE WHEN t.start_at - TRUNC(SYSDATE) > 0 THEN t.start_at - TRUNC(SYSDATE) END) OVER ()
        THEN 'RED'
        ELSE 'GREY'
        END AS badge_class
    --
FROM trp_trips t
JOIN x
    ON x.year_      = t.year_
WHERE t.created_by  = core.get_user_id()
ORDER BY
    t.start_at,
    t.end_at,
    t.trip_id;
/

