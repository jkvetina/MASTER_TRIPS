CREATE TABLE trp_trips (
    trip_id                         NUMBER(10,0)          GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 1000 CONSTRAINT trp_trips_nn_trip_id NOT NULL,
    trip_name                       VARCHAR2(128)         CONSTRAINT trp_trips_nn_trip_name NOT NULL,
    start_at                        DATE                  CONSTRAINT trp_trips_nn_start_at NOT NULL,
    end_at                          DATE                  CONSTRAINT trp_trips_nn_end_at NOT NULL,
    year_                           VARCHAR2(4),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    gps_lat                         NUMBER,
    gps_long                        NUMBER,
    country_name                    VARCHAR2(64),
    --
    CONSTRAINT trp_trips_pk
        PRIMARY KEY (trip_id)
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

