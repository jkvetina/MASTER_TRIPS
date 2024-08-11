const get_gps_coordinates = function(location_desc, event_link) {
    const page_id = apex.env.APP_PAGE_ID;
    //
    show_success('Dark magic initiated...');
    apex.server.process('GET_GPS_COORDINATES',
        {
            x01: location_desc,
            x02: event_link
        },
        {
            dataType: 'json',
            success: function(data) {
                console.log('RESPONSE', data);
                //
                apex.item('P' + page_id + '_GPS_LAT' ).setValue(data.latitude);
                apex.item('P' + page_id + '_GPS_LONG').setValue(data.longitude);
                //
                show_success('Dark magic done');
            }
        }
    );
};

const parse_gps_coordinates = function(google_link) {
    const page_id = apex.env.APP_PAGE_ID;
    //
    var result = google_link.match(/@\d+\.\d+,\d+\.\d+/);
    if (result) {
        result = result[0].replace('@', '').split(',');
        console.log('FOUND:', result);
        apex.item('P' + page_id + '_GPS_LAT' ).setValue(result[0]);
        apex.item('P' + page_id + '_GPS_LONG').setValue(result[1]);
    }
    //
};

