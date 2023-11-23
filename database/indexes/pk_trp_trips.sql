CREATE UNIQUE INDEX pk_trp_trips
    ON trp_trips (trip_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

