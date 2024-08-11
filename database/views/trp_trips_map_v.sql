CREATE OR REPLACE FORCE VIEW trp_trips_map_v AS
SELECT
    t.trip_id,
    t.trip_name,
    t.gps_lat,
    t.gps_long,
    --
    CASE WHEN t.start_at >= TRUNC(SYSDATE) THEN 'Y' END AS is_future,
    CASE WHEN t.start_at >= TRUNC(SYSDATE)
        THEN '#f00'
        ELSE '#666'
        END AS color
    --
FROM trp_trips_grid_v t
UNION ALL
--
SELECT
    0           AS trip_id,
    NULL        AS trip_name,
    50.1272     AS gps_lat,
    14.4939     AS gps_long,
    NULL        AS is_future,
    '#222'      AS color
    --
FROM DUAL;
/

