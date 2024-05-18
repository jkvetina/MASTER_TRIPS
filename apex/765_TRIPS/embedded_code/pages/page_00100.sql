-- ----------------------------------------
-- Page: 100 - Trip Overview > Region: Gantt [CHART] > Server-side Condition (Rows returned) > SQL Query

SELECT 1
FROM trp_itinerary_grid_v
WHERE ROWNUM = 1;

-- ----------------------------------------
-- Page: 100 - Trip Overview > Branch: GO_HOME > Server-side Condition (No Rows returned) > SQL Query

SELECT 1 AS trip_exists
FROM trp_trips t
WHERE t.trip_id = :P100_TRIP_ID;

-- ----------------------------------------
-- Page: 100 - Trip Overview > Process: GET_LINES > Source > PL/SQL Code

FOR c IN (
    SELECT COUNT(DISTINCT category_name) AS lines
    FROM trp_itinerary_gantt_v
) LOOP
    HTP.P(c.lines);
END LOOP;


-- ----------------------------------------
-- Page: 100 - Trip Overview > Process: GET_DETAIL_LINK > Source > PL/SQL Code

HTP.P(APEX_PAGE.GET_URL(
    p_page      => 110,
    p_items     => 'P110_TRIP_ID,P110_STOP_ID',
    p_values    => APEX_APPLICATION.G_X01 || ',' || APEX_APPLICATION.G_X02
));


-- ----------------------------------------
-- Page: 100 - Trip Overview > Button: ADD_STOP > Server-side Condition (Rows returned) > SQL Query

SELECT 1
FROM trp_itinerary_grid_v
WHERE ROWNUM = 1;

-- ----------------------------------------
-- Page: 100 - Trip Overview > Button: ADD_STOP_FIRST > Server-side Condition (No Rows returned) > SQL Query

SELECT 1
FROM trp_itinerary_grid_v
WHERE ROWNUM = 1;

