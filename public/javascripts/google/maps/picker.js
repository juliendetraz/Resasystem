var GoogleMapPicker = function(options) {
    mapElement = $(options.gmapPickerId);
    if (!mapElement)
        return ;
    this.options = options;
    this.geocoder = null;
    var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(46.943605722409444, 2.4922539062500038),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    this.map = new google.maps.Map(mapElement, mapOptions);
    var map = this.map;

    var placeMarker = function(location) {
        if (this.marker) this.marker.setMap(null);
        this.marker = GoogleMapPicker.prototype.getMarker(map, location, options);
        map.setCenter(location);
    }
    google.maps.event.addListener(this.map, 'click', function(event) {
        placeMarker(event.latLng);
        GoogleMapPicker.prototype.fillCoordFields(event.latLng, options);
    });
}

GoogleMapPicker.prototype.getMarker = function(map, location, options) {
    var marker = new google.maps.Marker({
            position: location,
            map: map,
            draggable: true,
            icon: 'images/icons/gmap-icon-picker.png'
    });
    google.maps.event.addListener(marker, 'dragend', function(event) {
        GoogleMapPicker.prototype.fillCoordFields(event.latLng, options);
    });
    return marker;
}

GoogleMapPicker.prototype.fillCoordFields = function(location, options) {
    var latFieldElement = $(options.latFieldId);
    var lngFieldElement = $(options.lngFieldId);
    if (latFieldElement) latFieldElement.value = location.lat();
    if (lngFieldElement) lngFieldElement.value = location.lng();
}

GoogleMapPicker.prototype.getAddress = function() {
    var address = new Array();
    var tmp = null;
    if ($(this.options.streetFieldId) && (tmp = $(this.options.streetFieldId).value))
        address.push(tmp);
    if ($(this.options.cityFieldId) && (tmp = $(this.options.cityFieldId).value))
        address.push(tmp);
    if ($(this.options.zipFieldId) && (tmp = $(this.options.zipFieldId).value))
        address.push(tmp);
    if ($(this.options.countryFieldId) && (tmp = $(this.options.countryFieldId).value))
        address.push(tmp);
    if (address.length < 1)
        return null;
    return address.join(',');
}

GoogleMapPicker.prototype.geolocalize = function() {
    var address = this.getAddress();
    if (address == null) {
        this.showMessage(this.options.messageEmptyAddress, this.options);
        this.log('empty address');
        return ;
    }
    var options = this.options;
    var map = this.map;
    if (!this.geocoder) this.geocoder = new google.maps.Geocoder();
    if (this.geocoder) {
        this.geocoder.geocode( {
            'address': address
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (this.marker)
                    this.marker.setMap(null);
                map.setCenter(results[0].geometry.location);
                map.setZoom(14);
                GoogleMapPicker.prototype.fillCoordFields(results[0].geometry.location, options);
                marker = GoogleMapPicker.prototype.getMarker(map, results[0].geometry.location, options);
                GoogleMapPicker.prototype.showMessage('', options);
            } else {
                if (status == google.maps.GeocoderStatus.ZERO_RESULTS)
                    GoogleMapPicker.prototype.showMessage(options.messageZeroResults, options);
                else
                    GoogleMapPicker.prototype.showMessage(options.messageGeoError, options);
                GoogleMapPicker.prototype.log('status : '+status);
            }
        });
    }
}

GoogleMapPicker.prototype.log = function(info) {
    try {console.log('Google Map Picker : '+info);} catch(e) {console = {log: function() {}}}
}

GoogleMapPicker.prototype.showMessage = function(message, options) {
    if (!options && !this.options) return ;
    if (this.options)
        options = this.options;
    if (options.messageElementId.length < 1) return ;
    var messageElement = $(options.messageElementId);
    if (!messageElement) return ;
    messageElement.update(message);
}