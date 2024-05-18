// ----------------------------------------
// Page: 100 - Trip Overview > Dynamic Action: DETECT_MODAL_CLOSED > When > JavaScript Expression

window

// ----------------------------------------
// Page: 100 - Trip Overview > Region: Gantt [CHART] > Attributes:  > Advanced > Initialization JavaScript Function

function (options) {
    var event = new Date();

    // define reference object line on the chart
    var constantLine = [
        { value: event.toISOString() }
    ];
    options.referenceObjects = constantLine;
    options.selectionMode = 'single';

    return options;
}


// ----------------------------------------
// Page: 100 - Trip Overview > Dynamic Action: GANTT_CLICKED > Action: Execute JavaScript Code > Settings > Code

// open modal dialog with detail
var data = this.data;
if (data.option === "selection" && data.value[0] !== undefined) {
    var trip_id = apex.item('P100_TRIP_ID').getValue();
    var stop_id = data.value[0];
    console.log('TASK', trip_id, stop_id, data);
    //
    apex.server.process('GET_DETAIL_LINK', {
        x01: trip_id,
        x02: stop_id,
    },
    {
        dataType: 'text',
        success: function(url) {
            apex.navigation.redirect(url);
        }
    });
}


// ----------------------------------------
// Page: 100 - Trip Overview > Dynamic Action: GANTT_REFRESHED > Action: Execute JavaScript Code > Settings > Code

// adjust gantt chart height
try {
    var chart_id    = 'GANTT_CHART';
    var trip_id     = apex.item('P100_TRIP_ID').getValue();
    //
    apex.server.process('GET_LINES', {
        x01: trip_id
    },
    {
        dataType: 'text',
        success: function(lines) {
            var height = 70 + (49 * lines);
            console.log('Refreshing', chart_id, height);
            $('#' + chart_id + '_jet').css('height', height);
        }
    });
}
catch (err) {
    console.error('ERROR', err);
}

