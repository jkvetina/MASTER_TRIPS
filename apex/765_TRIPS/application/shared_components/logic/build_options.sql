prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(59832276877256115)
,p_build_option_name=>'NEVER'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp.component_end;
end;
/
