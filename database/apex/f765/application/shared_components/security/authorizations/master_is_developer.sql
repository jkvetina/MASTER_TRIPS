prompt --application/shared_components/security/authorizations/master_is_developer
begin
--   Manifest
--     SECURITY SCHEME: MASTER - IS_DEVELOPER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(57889166082913574)  -- MASTER - IS_DEVELOPER
,p_name=>'MASTER - IS_DEVELOPER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN core.is_developer();'
,p_error_message=>'ACCESS_DENIED'
,p_reference_id=>34702806164823143
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
