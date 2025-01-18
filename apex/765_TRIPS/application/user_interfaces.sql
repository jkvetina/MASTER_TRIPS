prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(765)
,p_theme_id=>800
,p_home_url=>'f?p=&APP_ID.:HOME:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(29405511428377525)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(16650579182184696)  -- LIST: NAVIGATION_TRP
,p_nav_bar_list_template_id=>wwv_flow_imp.id(29405511428377525)
,p_nav_bar_template_options=>'#DEFAULT#:js-tabLike'
);
wwv_flow_imp.component_end;
end;
/
