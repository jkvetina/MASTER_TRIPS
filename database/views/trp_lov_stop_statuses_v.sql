CREATE OR REPLACE FORCE VIEW trp_lov_stop_statuses_v AS
SELECT
    REPLACE(t.status_id, 'STATUS_', '') AS status_id,
    --
    t.status_name   AS status_name,
    t.color_bg      AS color,
    --
    ROW_NUMBER() OVER (ORDER BY t.order#, t.status_id) AS order#
    --
FROM app_lovs t
WHERE t.app_id      = core.get_app_id()
    AND t.lov_id    = 'STATUS_TRIP'
    AND t.order#    IS NOT NULL;
/

