prompt --application/shared_components/navigation/lists/navigation_trp
begin
--   Manifest
--     LIST: NAVIGATION_TRP
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(16650579182184696)  -- LIST: NAVIGATION_TRP
,p_name=>'NAVIGATION_TRP'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    t.lvl,',
'    --',
'    NULL AS label,',
'    NULL AS target,',
'    NULL AS is_current_list_entry,',
'    NULL AS image,',
'    NULL AS image_attribute,',
'    NULL AS image_alt_attribute,',
'    --',
'    t.attribute01,',
'    t.attribute02,',
'    t.attribute03,',
'    t.attribute04,',
'    t.attribute05,',
'    t.attribute06,',
'    t.attribute07,',
'    t.attribute08,',
'    t.attribute09,',
'    t.attribute10',
'    --',
'FROM trp_navigation_v t',
'ORDER BY',
'    t.order# NULLS FIRST;'))
,p_list_status=>'PUBLIC'
,p_version_scn=>42190749948353
);
wwv_flow_imp.component_end;
end;
/
