prompt --application/shared_components/security/authentications/master_open_door_testing_only
begin
--   Manifest
--     AUTHENTICATION: MASTER - OPEN_DOOR (TESTING ONLY)
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>45920449781012831
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(96353050886840917)
,p_name=>'MASTER - OPEN_DOOR (TESTING ONLY)'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_05=>'N'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'/ords/f?p=800:9999:0::::P9999_ERROR:SESSION_INVALID'
,p_logout_url=>'/ords/f?p=800:9999:0'
,p_post_auth_process=>'app_auth.after_auth'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_reference_id=>63502441622441479
);
wwv_flow_imp.component_end;
end;
/
