prompt --application/shared_components/security/authentications/master_google
begin
--   Manifest
--     AUTHENTICATION: MASTER - GOOGLE
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
 p_id=>wwv_flow_imp.id(70028510378041441)
,p_name=>'MASTER - GOOGLE'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(62013508289982337)
,p_attribute_02=>'GOOGLE'
,p_attribute_07=>'profile,email'
,p_attribute_09=>'#email#'
,p_attribute_10=>'email,name'
,p_attribute_11=>'N'
,p_attribute_13=>'Y'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'/ords/f?p=800:9999:0::::P9999_ERROR:SESSION_INVALID'
,p_logout_url=>'/ords/f?p=800:9999:0'
,p_post_auth_process=>'app_auth.after_auth'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_reference_id=>24099271848341251
);
wwv_flow_imp.component_end;
end;
/
