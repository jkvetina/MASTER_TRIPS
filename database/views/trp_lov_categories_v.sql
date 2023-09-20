CREATE OR REPLACE FORCE VIEW trp_lov_categories_v AS
SELECT
    t.status_id     AS category_id,
    t.status_name   AS category_name,
    --
    ROW_NUMBER() OVER (ORDER BY t.order#, t.status_id) AS order#
    --
FROM app_lovs t
WHERE t.app_id      = core.get_app_id()
    AND t.lov_id    = 'CATEGORY';
--
COMMENT ON TABLE trp_lov_categories_v IS '';

