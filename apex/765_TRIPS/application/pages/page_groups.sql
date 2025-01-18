prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(115360446004041100)  -- PAGE GROUP: 1) Trips
,p_group_name=>'1) Trips'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(39810033196859631)  -- PAGE GROUP: 2) Trip Details
,p_group_name=>'2) Trip Details'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(71780864522049606)  -- PAGE GROUP: __ INTERNAL
,p_group_name=>'__ INTERNAL'
);
wwv_flow_imp.component_end;
end;
/
