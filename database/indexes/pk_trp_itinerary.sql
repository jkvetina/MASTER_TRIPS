CREATE UNIQUE INDEX pk_trp_itinerary
    ON trp_itinerary (trip_id, stop_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

