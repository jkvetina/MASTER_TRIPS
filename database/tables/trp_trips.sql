CREATE TABLE trp_trips (
    trip_id                         NUMBER(10,0)          NOT NULL,
    trip_name                       VARCHAR2(128)         NOT NULL,
    start_at                        DATE                  NOT NULL,
    end_at                          DATE                  NOT NULL,
    year_                           VARCHAR2(4),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    gps_lat                         NUMBER,
    gps_long                        NUMBER,
    --
    CONSTRAINT pk_trp_trips
        PRIMARY KEY (trip_id)
    country_name                    VARCHAR2(64)
);
--
COMMENT ON TABLE trp_trips IS '';
--
COMMENT ON COLUMN trp_trips.trip_id         IS '';
COMMENT ON COLUMN trp_trips.trip_name       IS '';
COMMENT ON COLUMN trp_trips.start_at        IS '';
COMMENT ON COLUMN trp_trips.end_at          IS '';
COMMENT ON COLUMN trp_trips.year_           IS '';
COMMENT ON COLUMN trp_trips.gps_lat         IS '';
COMMENT ON COLUMN trp_trips.gps_long        IS '';
COMMENT ON COLUMN trp_trips.country_name    IS '';

