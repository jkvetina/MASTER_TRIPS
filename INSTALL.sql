--
-- YOU HAVE TO INSTALL THE CORE PACKAGE FIRST
-- https://github.com/jkvetina/CORE23/tree/main/database
--
-- PACKAGE ................ 2
-- PACKAGE BODY ........... 2
-- SEQUENCE ............... 2
-- TABLE .................. 2
-- TRIGGER ................ 1
-- VIEW ................... 5

--
-- INIT
--
@@"./patches/10_init/01_init.sql"

--
-- SEQUENCES
--
@@"./database/sequences/trp_stop_id.sql"
@@"./database/sequences/trp_trip_id.sql"

--
-- TABLES
--
@@"./database/tables/trp_trips.sql"
@@"./database/tables/trp_itinerary.sql"

--
-- OBJECTS
--
@@"./patches/40_repeatable_objects/40_drop_objects.sql"
--
@@"./database/packages/trp_app.spec.sql"
@@"./database/views/trp_itinerary_grid_v.sql"
@@"./database/views/trp_lov_categories_v.sql"
@@"./database/views/trp_trips_grid_v.sql"
@@"./database/packages/trp_tapi.spec.sql"
@@"./database/views/trp_navigation_v.sql"
@@"./database/packages/trp_app.sql"
@@"./database/packages/trp_tapi.sql"
@@"./database/views/trp_itinerary_gantt_v.sql"

--
-- TRIGGERS
--
@@"./database/triggers/trp_trips__.sql"

--
-- MVIEWS
--
@@"./patches/50_mviews/50_recompile.sql"

--
-- INDEXES
--
@@"./patches/55_indexes/50_recompile.sql"

--
-- DATA
--
@@"./patches/60_data/app_applications.sql"
@@"./patches/60_data/app_lovs.sql"
@@"./patches/60_data/app_navigation.sql"
@@"./patches/60_data/app_contexts.sql"
--
COMMIT;

--
-- FINALLY
--
@@"./patches/90_finally/98_checks.sql"
@@"./patches/90_finally/96_stats.sql"
@@"./patches/90_finally/93_audit_colums.sql"
@@"./patches/90_finally/94_indexes.sql"
@@"./patches/90_finally/90_recompile.sql"
@@"./patches/90_finally/92_refresh_mvw.sql"

--
-- APEX
--
@@"./database/apex/f765/f765.sql"

