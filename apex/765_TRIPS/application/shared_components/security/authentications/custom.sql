prompt --application/shared_components/security/authentications/custom
begin
--   Manifest
--     AUTHENTICATION: CUSTOM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(41501601859913292)
,p_name=>'CUSTOM'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'master.app_auth.auth_function'
,p_attribute_05=>'N'
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'master.app_auth.after_auth'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_reference_id=>41495533057124518
,p_version_scn=>42190511488285
);
wwv_flow_imp.component_end;
end;
/
