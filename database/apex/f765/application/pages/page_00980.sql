prompt --application/pages/page_00980
begin
--   Manifest
--     PAGE: 00980
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>980
,p_name=>'#fa-question-circle'
,p_alias=>'HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Help'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(23660722781484627)  -- _ABOUT
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ol li {',
'  line-height: 200%;',
'}'))
,p_step_template=>wwv_flow_imp.id(17683267850506429)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(59731356907418259)  -- MASTER - IS_USER
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23616227563153239)
,p_plug_name=>'How to use the app'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17759298553506472)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23616287160153240)
,p_plug_name=>'[CONTENT]'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17725987703506456)
,p_plug_display_sequence=>20
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ol>',
'<li>create a trip on the Trips Planning page</li>',
'<li>fill in the itinerary</li>',
'<li>check your trip in the chart</li>',
'</ol>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp.component_end;
end;
/
