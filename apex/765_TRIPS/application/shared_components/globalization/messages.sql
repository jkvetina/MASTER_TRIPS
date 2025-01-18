prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(16195130628636340)
,p_name=>'CONSTRAINT_ERROR|APP_USERS_UQ'
,p_message_text=>'E-mail address is not unique'
,p_reference_id=>14894221798383917
,p_version_scn=>42101050470383
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(16194530432636339)
,p_name=>'SESSION_INVALID'
,p_message_text=>'Your session has expired.'
,p_reference_id=>14904637801524414
,p_version_scn=>42101051523113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(16193990583636337)
,p_name=>'SESSION_TIMEOUT'
,p_message_text=>'Your session has ended.'
,p_is_js_message=>true
,p_reference_id=>14904874577526538
,p_version_scn=>42101051539496
);
wwv_flow_imp.component_end;
end;
/
