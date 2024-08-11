prompt --application/shared_components/user_interface/lovs/lov_stop_status
begin
--   Manifest
--     LOV_STOP_STATUS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(11628157748055231)  -- LOV: LOV_STOP_STATUS
,p_lov_name=>'LOV_STOP_STATUS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TRP_LOV_STOP_STATUSES_V'
,p_return_column_name=>'STATUS_ID'
,p_display_column_name=>'STATUS_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41472011649582
);
wwv_flow_imp.component_end;
end;
/
