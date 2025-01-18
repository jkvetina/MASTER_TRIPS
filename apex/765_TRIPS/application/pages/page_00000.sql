prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>1000000000000
,p_default_application_id=>765
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(71780864522049606)  -- PAGE GROUP: __ INTERNAL
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(71923814376159361)
,p_plug_name=>'ITEMS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(29277583231377259)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BEFORE_FOOTER'
,p_location=>null
,p_plug_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(71923654551159359)
,p_name=>'P0_AJAX_PING_INTERVAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(71923814376159361)
,p_source=>'10'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Interval in seconds to fire AJAX_PING process'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(84651605371981842)
,p_name=>'P0_SUCCESS_MESSAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(71923814376159361)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'For passing messages from modal dialogs'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(84651743180981844)
,p_name=>'DIALOG_CLOSED'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(84651858950981845)
,p_event_id=>wwv_flow_imp.id(84651743180981844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''MODAL_CLOSED'', this.data.dialogPageId, this.data.closeAction, this.data);',
'if (this.data && this.data.successMessage && this.data.successMessage.text) {',
'    show_success(this.data.successMessage.text);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(84655881134981885)
,p_name=>'CLOSE_DIALOG'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#CLOSE_DIALOG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85004244873036852)
,p_event_id=>wwv_flow_imp.id(84655881134981885)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'There are unsaved changes on the page, do you want to continue?'
,p_attribute_03=>'danger'
,p_attribute_04=>' '
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.page.isChanged()'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(84655920280981886)
,p_event_id=>wwv_flow_imp.id(84655881134981885)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(97258417120538163)
,p_name=>'CHECK_SESSION'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97258507166538164)
,p_event_id=>wwv_flow_imp.id(97258417120538163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'check_session();'
);
wwv_flow_imp.component_end;
end;
/
