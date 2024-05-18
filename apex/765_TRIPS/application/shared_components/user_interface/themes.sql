prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(60148212088289976)
,p_theme_id=>800
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>63467056572439181
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(79156715514658066)
,p_default_dialog_template=>wwv_flow_imp.id(59900896879289784)
,p_error_template=>wwv_flow_imp.id(59890853332289778)
,p_printer_friendly_template=>wwv_flow_imp.id(59906099545289786)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(59890853332289778)
,p_default_button_template=>wwv_flow_imp.id(60063248519289891)
,p_default_region_template=>wwv_flow_imp.id(59923030250289799)
,p_default_chart_template=>wwv_flow_imp.id(59989577467289836)
,p_default_form_template=>wwv_flow_imp.id(59989577467289836)
,p_default_reportr_template=>wwv_flow_imp.id(59989577467289836)
,p_default_tabform_template=>wwv_flow_imp.id(59989577467289836)
,p_default_wizard_template=>wwv_flow_imp.id(59989577467289836)
,p_default_menur_template=>wwv_flow_imp.id(60002040993289843)
,p_default_listr_template=>wwv_flow_imp.id(59989577467289836)
,p_default_irr_template=>wwv_flow_imp.id(59979826851289831)
,p_default_report_template=>wwv_flow_imp.id(60027839402289861)
,p_default_label_template=>wwv_flow_imp.id(60060717525289884)
,p_default_menu_template=>wwv_flow_imp.id(60064768898289892)
,p_default_calendar_template=>wwv_flow_imp.id(60064870091289893)
,p_default_list_template=>wwv_flow_imp.id(60044245189289872)
,p_default_nav_list_template=>wwv_flow_imp.id(60056387763289879)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(79455842052658286)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(79455842052658286)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(59925825391289801)
,p_default_dialogr_template=>wwv_flow_imp.id(59923030250289799)
,p_default_option_label=>wwv_flow_imp.id(60060717525289884)
,p_default_required_label=>wwv_flow_imp.id(60061959562289886)
,p_default_navbar_list_template=>wwv_flow_imp.id(79455842052658286)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(800),'#APEX_FILES#themes/theme_42/23.2/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
