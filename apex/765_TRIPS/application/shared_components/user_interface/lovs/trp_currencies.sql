prompt --application/shared_components/user_interface/lovs/trp_currencies
begin
--   Manifest
--     TRP_CURRENCIES
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
 p_id=>wwv_flow_imp.id(22934845521824772)  -- LOV: TRP_CURRENCIES
,p_lov_name=>'TRP_CURRENCIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''CZK'' AS d, ''CZK'' AS r FROM DUAL UNION ALL',
'SELECT ''EUR'' AS d, ''EUR'' AS r FROM DUAL UNION ALL',
'SELECT ''USD'' AS d, ''USD'' AS r FROM DUAL;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>42190231346176
);
wwv_flow_imp.component_end;
end;
/
