prompt --application/shared_components/logic/application_items/g_app_name
begin
--   Manifest
--     APPLICATION ITEM: G_APP_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(14688698808406552)
,p_name=>'G_APP_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/
