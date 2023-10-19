prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(67422548002820357)  --  MAIN
,p_group_name=>' MAIN'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(23660722781484627)  -- ABOUT
,p_group_name=>'ABOUT'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(23434444450035233)  -- __ INTERNAL
,p_group_name=>'__ INTERNAL'
);
wwv_flow_imp.component_end;
end;
/
