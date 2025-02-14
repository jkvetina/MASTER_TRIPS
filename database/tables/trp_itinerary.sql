CREATE TABLE trp_itinerary (
    trip_id                         NUMBER(10,0)          CONSTRAINT trp_itinerary_nn_trip_id NOT NULL,
    stop_id                         NUMBER(10,0)          GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 1000 CONSTRAINT trp_itinerary_nn_stop_id NOT NULL,
    stop_name                       VARCHAR2(128)         CONSTRAINT trp_itinerary_nn_stop_name NOT NULL,
    category_id                     VARCHAR2(32)          CONSTRAINT trp_itinerary_nn_category_id NOT NULL,
    price                           NUMBER(10,0),
    start_at                        DATE,
    end_at                          DATE,
    notes                           VARCHAR2(4000),
    color_fill                      VARCHAR2(8),
    link_reservation                VARCHAR2(2000),
    link_event                      VARCHAR2(2000),
    is_reserved                     CHAR(1),
    is_paid                         CHAR(1),
    is_pending                      CHAR(1),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    gps_lat                         NUMBER,
    gps_long                        NUMBER,
    --
    CONSTRAINT trp_itinerary_ch_is_reserved
        CHECK (
            is_reserved = 'Y' OR is_reserved IS NULL
        ) ENABLE,
    --
    CONSTRAINT trp_itinerary_ch_is_paid
        CHECK (
            is_paid = 'Y' OR is_paid IS NULL
        ) ENABLE,
    --
    CONSTRAINT trp_itinerary_ch_is_pending
        CHECK (
            is_pending = 'Y' OR is_pending IS NULL
        ) ENABLE,
    --
    CONSTRAINT trp_itinerary_pk
        PRIMARY KEY (
            trip_id,
            stop_id
        ),
    --
    CONSTRAINT trp_itinerary_fk_trips
        FOREIGN KEY (trip_id)
        REFERENCES trp_trips (trip_id)
);
--
COMMENT ON TABLE trp_itinerary IS '';
--
COMMENT ON COLUMN trp_itinerary.trip_id             IS '';
COMMENT ON COLUMN trp_itinerary.stop_id             IS '';
COMMENT ON COLUMN trp_itinerary.stop_name           IS '';
COMMENT ON COLUMN trp_itinerary.category_id         IS '';
COMMENT ON COLUMN trp_itinerary.price               IS '';
COMMENT ON COLUMN trp_itinerary.start_at            IS '';
COMMENT ON COLUMN trp_itinerary.end_at              IS '';
COMMENT ON COLUMN trp_itinerary.notes               IS '';
COMMENT ON COLUMN trp_itinerary.color_fill          IS '';
COMMENT ON COLUMN trp_itinerary.link_reservation    IS '';
COMMENT ON COLUMN trp_itinerary.link_event          IS '';
COMMENT ON COLUMN trp_itinerary.is_reserved         IS '';
COMMENT ON COLUMN trp_itinerary.is_paid             IS '';
COMMENT ON COLUMN trp_itinerary.is_pending          IS '';
COMMENT ON COLUMN trp_itinerary.gps_lat             IS '';
COMMENT ON COLUMN trp_itinerary.gps_long            IS '';

