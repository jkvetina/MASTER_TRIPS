prompt --application/shared_components/security/authorizations/master_is_developer
begin
--   Manifest
--     SECURITY SCHEME: MASTER - IS_DEVELOPER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(94514406891423908)  -- AUTHORIZATION: MASTER - IS_DEVELOPER
,p_name=>'MASTER - IS_DEVELOPER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN core.is_developer();'
,p_error_message=>'ACCESS_DENIED|IS_DEVELOPER'
,p_reference_id=>60089834032939902
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
