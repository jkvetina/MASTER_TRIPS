prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>45920449781012831
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(104047788811330691)  --  MAIN
,p_group_name=>' MAIN'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(60468207329339197)  -- __ INTERNAL
,p_group_name=>'__ INTERNAL'
);
wwv_flow_imp.component_end;
end;
/
