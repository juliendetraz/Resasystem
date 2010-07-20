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

    google.maps.event.addListener(this.map, 'click', function(event) {
        GoogleMapPicker.prototype.placeMarker(event.latLng, map);
        GoogleMapPicker.prototype.fillCoordFields(event.latLng, options);
    });
}


GoogleMapPicker.prototype.placeMarker = function(location, map) {
    if (this.marker) this.marker.setMap(null);
    this.marker = new google.maps.Marker({
        position: location,
        map: map,
        icon: 'images/icons/gmap-icon-picker.png'
    });
    map.setCenter(location);
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
//    return '19 rue Biot, 75017 Paris, France';
}

GoogleMapPicker.prototype.geolocalize = function() {
    var address = this.getAddress();
    if (address == null) {
        alert('empty address');
        return ;
    }
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
                marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    icon: 'images/icons/gmap-icon-picker.png'
                });
            } else {
                console.log('fail geocoder');
            }
        });
    }
}
