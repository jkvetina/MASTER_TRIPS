prompt --application/shared_components/user_interface/templates/button/text
begin
--   Manifest
--     BUTTON TEMPLATE: TEXT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(17866172241506537)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>63463978601439167
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>800
);
wwv_flow_imp.component_end;
end;
/
