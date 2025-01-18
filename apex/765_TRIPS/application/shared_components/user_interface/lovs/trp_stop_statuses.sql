prompt --application/shared_components/user_interface/lovs/trp_stop_statuses
begin
--   Manifest
--     TRP_STOP_STATUSES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(22940814940765640)  -- LOV: TRP_STOP_STATUSES
,p_lov_name=>'TRP_STOP_STATUSES'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TRP_LOV_STOP_STATUSES_V'
,p_return_column_name=>'STATUS_ID'
,p_display_column_name=>'STATUS_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
,p_version_scn=>42190231340073
);
wwv_flow_imp.component_end;
end;
/
