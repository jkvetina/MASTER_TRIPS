prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>45920449781012831
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(59832276877256115)
,p_build_option_name=>'NEVER'
,p_build_option_status=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp.component_end;
end;
/
