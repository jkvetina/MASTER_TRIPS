-- ----------------------------------------
-- Page: 110 - Stop Detail > Computation: P110_TRIP_START_AT > Computation > SQL Query

SELECT TO_CHAR(MIN(t.start_at), 'YYYY-MM-DD')
FROM trp_trips t
WHERE t.trip_id = :P110_TRIP_ID;

-- ----------------------------------------
-- Page: 110 - Stop Detail > Process: INIT_DEFAULTS > Source > PL/SQL Code

-- links to prev/next stops
BEGIN
    SELECT t.stop_id
    INTO :P110_NEXT_STOP
    FROM trp_itinerary_grid_v t
    WHERE t.r# = (SELECT r# FROM trp_itinerary_grid_v WHERE stop_id = :P110_STOP_ID) + 1;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    :P110_NEXT_STOP := NULL;
END;
--
BEGIN
    SELECT t.stop_id
    INTO :P110_PREV_STOP
    FROM trp_itinerary_grid_v t
    WHERE t.r# = (SELECT r# FROM trp_itinerary_grid_v WHERE stop_id = :P110_STOP_ID) - 1;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    :P110_PREV_STOP := NULL;
END;


