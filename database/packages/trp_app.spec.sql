CREATE OR REPLACE PACKAGE trp_app as

    PROCEDURE save_trips;



    PROCEDURE save_itinerary;



    PROCEDURE set_defaults;



    PROCEDURE set_days;



    FUNCTION set_colors
    RETURN CLOB;



    PROCEDURE init_default_p105;
    --
    PROCEDURE init_default_p110;



    PROCEDURE get_gps_coords_from_ai (
        in_location         VARCHAR2
    );



    PROCEDURE get_gps_coords (
        in_location         VARCHAR2,
        in_event_link       VARCHAR2 := NULL
    );

END;
/

