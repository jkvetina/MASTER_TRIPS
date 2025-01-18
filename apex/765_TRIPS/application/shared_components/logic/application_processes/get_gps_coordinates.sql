prompt --application/shared_components/logic/application_processes/get_gps_coordinates
begin
--   Manifest
--     APPLICATION PROCESS: GET_GPS_COORDINATES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(22538556880634977)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_GPS_COORDINATES'
,p_process_sql_clob=>'trp_app.get_gps_coords();'
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>41474021607241
);
wwv_flow_imp.component_end;
end;
/
