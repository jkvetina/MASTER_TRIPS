BEGIN
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MERGE ' || UPPER('app_lovs'));
    DBMS_OUTPUT.PUT_LINE('--');
END;
/
--
DELETE FROM app_lovs
WHERE app_id = 765;
--
MERGE INTO app_lovs t
USING (
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, 'Category' AS lov_name, 'AIRPLANE' AS status_id, 'Airplane' AS status_name, 10 AS order#, NULL AS treshold, '#686461' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, '?' AS status_id, '?' AS status_name, 25 AS order#, NULL AS treshold, '#8b6e28' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'CAR_RENTAL' AS status_id, 'Car Rental' AS status_name, 35 AS order#, NULL AS treshold, '#e7eaef' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'EVENT' AS status_id, 'Event #1' AS status_name, 50 AS order#, NULL AS treshold, '#84a02b' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'EVENT2' AS status_id, 'Event #2' AS status_name, 55 AS order#, NULL AS treshold, '#a5a831' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'EVENT3' AS status_id, 'Event #3' AS status_name, 60 AS order#, NULL AS treshold, '#ffffff' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'EVENT4' AS status_id, 'Event #4' AS status_name, 65 AS order#, NULL AS treshold, '#ffffff' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'EXPENSE' AS status_id, 'Expense (cost tracking only)' AS status_name, NULL AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'HOTEL' AS status_id, 'Hotel' AS status_name, 30 AS order#, NULL AS treshold, '#e7eaef' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'ROADTRIP' AS status_id, 'Roadtrip' AS status_name, 40 AS order#, NULL AS treshold, '#cfdbda' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'APP' AS lov_group, 'CATEGORY' AS lov_id, NULL AS lov_name, 'TRANSFER' AS status_id, 'Transfer' AS status_name, 20 AS order#, NULL AS treshold, '#ffffff' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'STATUSES' AS lov_group, 'STATUS_TRIP' AS lov_id, 'Trip Status' AS lov_name, 'STATUS_PENDING' AS status_id, 'Pending' AS status_name, 10 AS order#, NULL AS treshold, '#e7242d' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'STATUSES' AS lov_group, 'STATUS_TRIP' AS lov_id, NULL AS lov_name, 'STATUS_PAID' AS status_id, 'Paid' AS status_name, 20 AS order#, NULL AS treshold, '#778d45' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'STATUSES' AS lov_group, 'STATUS_TRIP' AS lov_id, NULL AS lov_name, 'STATUS_RESERVED' AS status_id, 'Reserved' AS status_name, 15 AS order#, NULL AS treshold, '#e8b100' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL UNION ALL
    SELECT 765 AS app_id, 'STATUSES' AS lov_group, 'STATUS_TRIP' AS lov_id, NULL AS lov_name, 'STATUS_UNKNOWN' AS status_id, 'Unknown' AS status_name, NULL AS order#, NULL AS treshold, '#ffffff' AS color_bg, NULL AS color_text, NULL AS status_value FROM DUAL
) s
ON (
    t.app_id = s.app_id
    AND t.app_id = s.app_id
    AND t.lov_group = s.lov_group
    AND t.lov_id = s.lov_id
    AND t.lov_id = s.lov_id
    AND t.status_id = s.status_id
    AND t.status_id = s.status_id
    AND t.treshold = s.treshold
    AND t.treshold = s.treshold
)
--WHEN MATCHED THEN
--    UPDATE SET
--        t.lov_name = s.lov_name,
--        t.status_name = s.status_name,
--        t.order# = s.order#,
--        t.color_bg = s.color_bg,
--        t.color_text = s.color_text,
--        t.status_value = s.status_value
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.lov_group,
        t.lov_id,
        t.lov_name,
        t.status_id,
        t.status_name,
        t.order#,
        t.treshold,
        t.color_bg,
        t.color_text,
        t.status_value
    )
    VALUES (
        s.app_id,
        s.lov_group,
        s.lov_id,
        s.lov_name,
        s.status_id,
        s.status_name,
        s.order#,
        s.treshold,
        s.color_bg,
        s.color_text,
        s.status_value
    );
