prompt --application/shared_components/logic/application_processes/get_coords_from_ai
begin
--   Manifest
--     APPLICATION PROCESS: GET_COORDS_FROM_AI
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(11225899687924568)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_COORDS_FROM_AI'
,p_process_sql_clob=>'NULL;'
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>41471951028970
);
wwv_flow_imp.component_end;
end;
/
