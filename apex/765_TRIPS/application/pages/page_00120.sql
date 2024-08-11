prompt --application/pages/page_00120
begin
--   Manifest
--     PAGE: 00120
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>120
,p_name=>'Trips Planning'
,p_alias=>'HOME'
,p_step_title=>'Trips Planning'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(104047788811330691)  -- PAGE GROUP:  MAIN
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.RED {',
'  background: red;',
'  color: #fff;',
'}',
'.GREY {',
'  background: #ccc;',
'  color: #fff;',
'}',
''))
,p_page_css_classes=>'MULTICOLUMN'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(96356597715928593)  -- AUTHORIZATION: MASTER - IS_USER
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'How to use the app?',
'',
'- create a trip on the Trips Planning page',
'- fill in the itinerary',
'- check your trip in the chart',
''))
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8594624432358111)
,p_plug_name=>'[MAP]'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin-top: 2rem;"'
,p_plug_template=>wwv_flow_imp.id(59923030250289799)
,p_plug_display_sequence=>40
,p_location=>null
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_MAP_REGION'
);
wwv_flow_imp_page.create_map_region(
 p_id=>wwv_flow_imp.id(8594707191358112)
,p_region_id=>wwv_flow_imp.id(8594624432358111)
,p_height=>640
,p_tilelayer_type=>'CUSTOM'
,p_tilelayer_name_default=>'osm-positron'
,p_navigation_bar_type=>'FULL'
,p_navigation_bar_position=>'END'
,p_init_position_zoom_type=>'QUERY_RESULTS'
,p_init_position_from_browser=>true
,p_layer_messages_position=>'BELOW'
,p_show_legend=>false
,p_features=>'MOUSEWHEEL_ZOOM:RECTANGLE_ZOOM:SCALE_BAR:INFINITE_MAP:BROWSER_LOCATION:CIRCLE_TOOL:DISTANCE_TOOL'
);
wwv_flow_imp_page.create_map_region_layer(
 p_id=>wwv_flow_imp.id(8594880453358113)
,p_map_region_id=>wwv_flow_imp.id(8594707191358112)
,p_name=>'PAST_EVENTS'
,p_layer_type=>'POINT'
,p_display_sequence=>10
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_table_name=>'TRP_TRIPS_MAP_V'
,p_where_clause=>'is_future IS NULL'
,p_include_rowid_column=>false
,p_items_to_submit=>'P120_YEAR'
,p_has_spatial_index=>false
,p_pk_column=>'TRIP_ID'
,p_geometry_column_data_type=>'LONLAT_COLUMNS'
,p_longitude_column=>'GPS_LONG'
,p_latitude_column=>'GPS_LAT'
,p_stroke_color=>'#000000'
,p_fill_color=>'&COLOR.'
,p_point_display_type=>'SVG'
,p_point_svg_shape=>'Default'
,p_point_svg_shape_scale=>'1.5'
,p_feature_clustering=>false
,p_tooltip_adv_formatting=>false
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:100:P100_TRIP_ID:&TRIP_ID.'
,p_display_in_legend=>false
);
wwv_flow_imp_page.create_map_region_layer(
 p_id=>wwv_flow_imp.id(8597526677358140)
,p_map_region_id=>wwv_flow_imp.id(8594707191358112)
,p_name=>'FUTURE_EVENTS'
,p_layer_type=>'POINT'
,p_display_sequence=>20
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_table_name=>'TRP_TRIPS_MAP_V'
,p_where_clause=>'is_future = ''Y'''
,p_include_rowid_column=>false
,p_items_to_submit=>'P120_YEAR'
,p_has_spatial_index=>false
,p_pk_column=>'TRIP_ID'
,p_geometry_column_data_type=>'LONLAT_COLUMNS'
,p_longitude_column=>'GPS_LONG'
,p_latitude_column=>'GPS_LAT'
,p_stroke_color=>'#000000'
,p_fill_color=>'&COLOR.'
,p_point_display_type=>'SVG'
,p_point_svg_shape=>'Default'
,p_point_svg_shape_scale=>'1.5'
,p_feature_clustering=>false
,p_tooltip_adv_formatting=>false
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:100:P100_TRIP_ID:&TRIP_ID.'
,p_display_in_legend=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(46318514789303210)
,p_plug_name=>'Trips [CARDS]'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(59930115538289803)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'TRP_TRIPS_GRID_V'
,p_include_rowid_column=>false
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P120_YEAR'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(46318661781303211)
,p_region_id=>wwv_flow_imp.id(46318514789303210)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_title_column_name=>'TRIP_NAME'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="a-CardView-subTitle">&START_AT. - &END_AT.</span>',
'<br /><br />'))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'BADGE_DAYS'
,p_badge_css_classes=>'&BADGE_CLASS.'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'OLD_TRIP_ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(46318785031303212)
,p_card_id=>wwv_flow_imp.id(46318661781303211)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:100:P100_TRIP_ID:&TRIP_ID.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(161813364415594570)
,p_plug_name=>'Trips for &P120_YEAR.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(59956268800289818)
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(46365495208379647)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(161813364415594570)
,p_button_name=>'ADD_TRIP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(60062458726289887)
,p_button_image_alt=>'Add Trip'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:105::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(46318978957303214)
,p_name=>'P120_YEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(161813364415594570)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(46319321997303218)
,p_computation_sequence=>10
,p_computation_item=>'P120_YEAR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'NVL(:P120_YEAR, TO_CHAR(TRUNC(SYSDATE), ''YYYY''))'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(46377131529379675)
,p_name=>'DETECT_MODAL_CLOSED'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(46319006430303215)
,p_name=>'CHANGED_FILTERS'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_YEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(46319181803303216)
,p_event_id=>wwv_flow_imp.id(46319006430303215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp.component_end;
end;
/
