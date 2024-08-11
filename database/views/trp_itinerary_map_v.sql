CREATE OR REPLACE FORCE VIEW trp_itinerary_map_v AS
SELECT
    t.trip_id,
    t.stop_id,
    t.stop_name,
    --
    t.gps_lat,
    t.gps_long,
    t.color_fill AS color
    --
FROM trp_itinerary t
UNION ALL
--
SELECT
    0           AS trip_id,
    0           AS stop_id,
    NULL        AS stop_name,
    50.1272     AS gps_lat,
    14.4939     AS gps_long,
    '#222'      AS color
    --
FROM DUAL;
/

