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



END;
/

