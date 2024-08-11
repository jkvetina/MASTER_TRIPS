// ----------------------------------------
// Page: 110 - Stop Detail > Dynamic Action: CHANGED_STOP_STATUS > Action: Execute JavaScript Code > Settings > Code

// change styles
var page_id     = apex.env.APP_PAGE_ID.toString();
var color_map   = JSON.parse(apex.item('P' + page_id + '_STOP_STATUS_JSON').getValue())[0];
var value       = apex.item('P' + page_id + '_STOP_STATUS').getValue();
var color       = color_map[value];
//
if (color && color.length > 0) {
    $('select#P' + page_id + '_STOP_STATUS').css('border-left', '8px solid ' + color);
    $('label#P' + page_id + '_STOP_STATUS_LABEL').css('padding-left', '0.95rem');
}
else {
    $('select#P' + page_id + '_STOP_STATUS').css('border-left', '1px solid var(--a-field-input-state-border-color,var(--a-field-input-border-color))');
    $('label#P' + page_id + '_STOP_STATUS_LABEL').css('padding-left', '0.5rem');
}


