prompt --application/shared_components/security/authentications/master_open_door_testing_only
begin
--   Manifest
--     AUTHENTICATION: MASTER - OPEN_DOOR (TESTING ONLY)
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(59727810078330583)
,p_name=>'MASTER - OPEN_DOOR (TESTING ONLY)'
,p_scheme_type=>'NATIVE_OPEN_DOOR'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>38115413754324720
);
wwv_flow_imp.component_end;
end;
/
