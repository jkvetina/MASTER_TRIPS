prompt --application/shared_components/files/icons_app_icon_32_png
begin
--   Manifest
--     APP STATIC FILES: 765
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>765
,p_default_id_offset=>13885638367144232
,p_default_owner=>'APPS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE9000001A0494441545847ED944D4B025114865FC98F12FC001D2D6B1699846E6A13D446A2454411FD857E4BDB7E443FA2AD449BA08222';
wwv_flow_imp.g_varchar2_table(2) := 'DAA464193261E58C290E397E141367A0207566EE2812D1DCD59DCB9D799FF3BE678E632FB3ABE21797C306B01DB01DF8B30EF8C7C20838396D82DC942EE10B79079A2603CF01DE93C2627C5913BD2E9C436865FF01405BE96855B61A1D045D11C4385E7B';
wwv_flow_imp.g_varchar2_table(3) := '2E89026A9DB2B6B71A85A50856621B48CF6D1B5A7D70B28F8A2A30C7610960895B473C9244A19CC35A7207C7B9434DE86B9F984AE1EE298B0B31333A0012335A04357280E2EB2DCEEE8F205545286A1DE9E4261ACADBB7132301A006941EEB48CC243119';
wwv_flow_imp.g_varchar2_table(4) := '8D22E80BFF30A2264B7878CEC3EF0C41FC28C23DE1628AC1B4074898F3F0708F3BC173891E513AE88611A517949B02E466D5148409603A30DB234EC254753F003A230896E1640A401F932B0DAC2E6CF5586A0470953F85EA6D99C6C0044031F473410F80';
wwv_flow_imp.g_varchar2_table(5) := 'B57AA26302D073410F80B57A4B007A2E747B6CA57A660012A7F9DF56DE118FCD1BE65AA9D16C90E1F1BA4CFF006600D34E1AE202730F0CA161F8AA0D603B603BF0097C660270B8D7A6760000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(87451347390547672)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
