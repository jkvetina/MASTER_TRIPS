prompt --application/shared_components/user_interface/lovs/trp_years
begin
--   Manifest
--     TRP_YEARS
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
 p_id=>wwv_flow_imp.id(39825148903439024)  -- LOV: TRP_YEARS
,p_lov_name=>'TRP_YEARS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TRP_LOV_YEARS_V'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
,p_version_scn=>42190231335618
);
wwv_flow_imp.component_end;
end;
/
