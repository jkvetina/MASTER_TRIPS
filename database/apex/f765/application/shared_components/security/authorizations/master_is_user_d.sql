prompt --application/shared_components/security/authorizations/master_is_user_d
begin
--   Manifest
--     SECURITY SCHEME: MASTER - IS_USER_D
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>45920449781012831
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(60558375132487525)  -- MASTER - IS_USER_D
,p_name=>'MASTER - IS_USER_D'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN app_auth.is_user_component (',
'    in_component_id     => :APP_COMPONENT_ID,',
'    in_component_type   => :APP_COMPONENT_TYPE,',
'    in_component_name   => :APP_COMPONENT_NAME,',
'    in_action           => ''D''',
') = ''Y'';'))
,p_error_message=>'ACCESS_DENIED|IS_USER_D'
,p_reference_id=>14636315967358599
,p_caching=>'NOCACHE'
);
wwv_flow_imp.component_end;
end;
/
