-- ----------------------------------------
-- Application Process: AJAX_PING > Source > PL/SQL Code

app.ajax_ping();

-- ----------------------------------------
-- Application Process: GET_GPS_COORDINATES > Source > PL/SQL Code

trp_app.get_gps_coords (
    in_location => APEX_APPLICATION.G_X01
);

-- ----------------------------------------
-- Application Process: INIT_DEFAULTS > Source > PL/SQL Code

app.init_defaults();

