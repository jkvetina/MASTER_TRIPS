prompt --application/shared_components/security/authentications/master_apex_accounts
begin
--   Manifest
--     AUTHENTICATION: MASTER - APEX_ACCOUNTS
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
 p_id=>wwv_flow_imp.id(59727607674330582)
,p_name=>'MASTER - APEX_ACCOUNTS'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>37901138623322271
);
wwv_flow_imp.component_end;
end;
/