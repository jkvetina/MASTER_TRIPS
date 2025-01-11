CREATE OR REPLACE FORCE VIEW trp_lov_years_v AS
SELECT
    t.year_     AS id,
    t.year_     AS name,
    --
    ROW_NUMBER() OVER (ORDER BY t.year_ DESC) AS order#
    --
FROM trp_trips t
GROUP BY
    t.year_;
/

