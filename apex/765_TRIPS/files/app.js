const get_gps_coordinates = function(location_desc) {
    const page_id = apex.env.APP_PAGE_ID;
    //
    show_success('Dark magic initiated...');
    apex.server.process('GET_GPS_COORDINATES',
        {
            x01: location_desc
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

