prompt --application/shared_components/user_interface/lovs/master_lov_applications
begin
--   Manifest
--     MASTER - LOV_APPLICATIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>45920449781012831
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(79722701835460871)  -- MASTER - LOV_APPLICATIONS
,p_lov_name=>'MASTER - LOV_APPLICATIONS'
,p_reference_id=>9887859263442428
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'INT_P100_APPS_V'
,p_return_column_name=>'APP_ID'
,p_display_column_name=>'APPLICATION_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'APPLICATION_NAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
