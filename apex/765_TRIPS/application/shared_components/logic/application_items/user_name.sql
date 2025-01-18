prompt --application/shared_components/logic/application_items/user_name
begin
--   Manifest
--     APPLICATION ITEM: USER_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(16186443778636306)
,p_name=>'USER_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_reference_id=>13992628993210618
,p_version_scn=>42101049136175
);
wwv_flow_imp.component_end;
end;
/
