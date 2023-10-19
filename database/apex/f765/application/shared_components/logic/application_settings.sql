prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(14534597660914188)
,p_name=>'APP_PREFIX'
,p_value=>'TRP_'
,p_is_required=>'Y'
,p_on_upgrade_keep_value=>true
);
wwv_flow_imp.component_end;
end;
/
