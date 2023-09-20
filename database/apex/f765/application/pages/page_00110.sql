prompt --application/pages/page_00110
begin
--   Manifest
--     PAGE: 00110
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
 p_id=>110
,p_name=>'Add/Edit Stop'
,p_alias=>'STOP'
,p_page_mode=>'MODAL'
,p_step_title=>'Add/Edit Stop'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(67422548002820357)  --  MAIN
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.GOTO_BUTTON {',
'    margin-top: 0.9rem;',
'    float: right;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(59731356907418259)  -- MASTER - IS_USER
,p_dialog_width=>'800'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61508979059840437)
,p_plug_name=>'&P110_HEADER.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17759298553506472)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61509134372840438)
,p_plug_name=>'[FORM]'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17725987703506456)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'TRP_ITINERARY'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19759300777896038)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_button_name=>'GOTO_RESERVATION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17866172241506537)
,p_button_image_alt=>'Go'
,p_button_redirect_url=>'javascript:window.open(''&P110_LINK_RESERVATION.'', ''_blank'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P110_LINK_RESERVATION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'GOTO_BUTTON'
,p_icon_css_classes=>'fa-external-link'
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19759262131896037)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_button_name=>'GOTO_EVENT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17866172241506537)
,p_button_image_alt=>'Go'
,p_button_redirect_url=>'javascript:window.open(''&P110_LINK_EVENT.'', ''_blank'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P110_LINK_EVENT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'GOTO_BUTTON'
,p_icon_css_classes=>'fa-external-link'
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23710179682896203)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_button_name=>'CREATE_STOP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17866172241506537)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P110_SUBMIT.'
,p_button_position=>'NEXT'
,p_button_css_classes=>'u-pullRight'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23620092432153278)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_button_name=>'DELETE_STOP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17865448457506535)
,p_button_image_alt=>'Delete Stop'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'Do you really want to delete the stop?'
,p_button_css_classes=>'u-pullRight'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23709120144896202)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(61508979059840437)
,p_button_name=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17865448457506535)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-pullRight'
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23617864431153256)
,p_name=>'P110_STOP_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_source=>'STOP_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23617982792153257)
,p_name=>'P110_STOP_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Stop Name'
,p_source=>'STOP_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618039986153258)
,p_name=>'P110_CATEGORY_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Category Id'
,p_source=>'CATEGORY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CATEGORIES'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618218845153259)
,p_name=>'P110_PRICE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Price'
,p_source=>'PRICE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618272079153260)
,p_name=>'P110_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618422450153261)
,p_name=>'P110_COLOR_FILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Color Fill'
,p_source=>'COLOR_FILL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_cMaxlength=>8
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618533665153262)
,p_name=>'P110_IS_RESERVED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Is Reserved'
,p_source=>'IS_RESERVED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618576951153263)
,p_name=>'P110_IS_PAID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Is Paid'
,p_source=>'IS_PAID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23618734525153264)
,p_name=>'P110_IS_PENDING'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Is Pending'
,p_source=>'IS_PENDING'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>11
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23619525893153272)
,p_name=>'P110_SUBMIT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(61508979059840437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23620227116153279)
,p_name=>'P110_LINK_RESERVATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Link Reservation'
,p_source=>'LINK_RESERVATION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23620272277153280)
,p_name=>'P110_LINK_EVENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Link Event'
,p_source=>'LINK_EVENT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23983277497895345)
,p_name=>'P110_TRIP_START_AT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61508979059840437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33441589586905216)
,p_name=>'P110_TRIP_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_source=>'TRIP_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33441853523905218)
,p_name=>'P110_START_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'Start At'
,p_format_mask=>'YYYY-MM-DD HH24:MI'
,p_source=>'START_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P110_TRIP_START_AT'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_13=>'VISIBLE'
,p_attribute_14=>'5'
,p_attribute_15=>'FOCUS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33441899168905219)
,p_name=>'P110_END_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_prompt=>'End At'
,p_format_mask=>'YYYY-MM-DD HH24:MI'
,p_source=>'END_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(17863699601506533)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P110_START_AT'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_13=>'VISIBLE'
,p_attribute_14=>'5'
,p_attribute_15=>'FOCUS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33442006465905220)
,p_name=>'P110_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33442103515905221)
,p_name=>'P110_CREATED_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_item_source_plug_id=>wwv_flow_imp.id(61509134372840438)
,p_source=>'CREATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61510472604840447)
,p_name=>'P110_HEADER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61508979059840437)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(23714865348896208)
,p_computation_sequence=>10
,p_computation_item=>'P110_HEADER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CASE WHEN :P110_STOP_ID IS NULL',
'    THEN ''Create Stop''',
'    ELSE ''Update Stop'' END'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(23619623265153273)
,p_computation_sequence=>20
,p_computation_item=>'P110_SUBMIT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CASE WHEN :P110_STOP_ID IS NULL',
'    THEN ''Create Stop''',
'    ELSE ''Update Stop'' END'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(23983364696895346)
,p_computation_sequence=>30
,p_computation_item=>'P110_TRIP_START_AT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_CHAR(MIN(t.start_at), ''YYYY-MM-DD'')',
'FROM trp_trips t',
'WHERE t.trip_id = :P110_TRIP_ID'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(23715562144896209)
,p_name=>'CLOSE_DIALOG'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(23709120144896202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(23716055237896209)
,p_event_id=>wwv_flow_imp.id(23715562144896209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23715238080896208)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'SAVE_FORM'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'TRP_APP'
,p_attribute_04=>'SAVE_ITINERARY'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9829599713751976
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23619660468153274)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE_DIALOG'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9734022101009042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23714320565896207)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(61509134372840438)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'INIT_FORM'
,p_internal_uid=>9828682198751975
);
wwv_flow_imp.component_end;
end;
/
