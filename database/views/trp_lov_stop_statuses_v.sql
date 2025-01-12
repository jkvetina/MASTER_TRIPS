CREATE OR REPLACE FORCE VIEW trp_lov_stop_statuses_v AS
SELECT
    REPLACE(t.status_id, 'STATUS_', '') AS status_id,
    --
    t.status_name   AS status_name,
    t.color_bg      AS color,
    --
    ROW_NUMBER() OVER (ORDER BY t.order#, t.status_id) AS order#
    --
FROM app_lovs_vpd_v t
WHERE 1 = 1
    AND t.lov_id    = 'STATUS_TRIP'
    AND t.order#    IS NOT NULL;
/

