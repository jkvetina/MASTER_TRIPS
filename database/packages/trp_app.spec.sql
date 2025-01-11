CREATE OR REPLACE PACKAGE trp_app as

    PROCEDURE init_p100;



    PROCEDURE init_p105;



    PROCEDURE init_p150;



    PROCEDURE init_p155;



    PROCEDURE save_trips;



    PROCEDURE save_itinerary;



    PROCEDURE set_days;



    FUNCTION set_colors
    RETURN CLOB;



    PROCEDURE get_gps_coords_from_ai (
        in_location         VARCHAR2,
        in_country          VARCHAR2
    );



    PROCEDURE get_gps_coords_from_web (
        in_event_link       VARCHAR2
    );



    PROCEDURE get_gps_coords;

END;
/

