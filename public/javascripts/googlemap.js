function	loadMap(pageUri)
{
    var mapElement = $('gmap');
    if (!mapElement)
        return ;
    new Ajax.Request(pageUri+'.json', {
        method: 'get',
        requestHeaders: {
            Accept: 'application/json'
        },
        onSuccess: function(transport){
            var response = transport.responseText || "no response text";
            response = response.evalJSON();
            //mapElement.update("Success! <br /><pre>" + response + "</pre>");
            placeMap(response);
        },
        onLoading: function(){
            mapElement.update('LOADING...')
        },
        onFailure: function(){
            mapElement.update('EPIC FAIL...')
        }
    });

    function    placeMap(housings)
    {
        var mapOptions = {
            //zoom: 6,
            //center: new google.maps.LatLng(47.390251,0.688877),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var housingMap = new google.maps.Map(mapElement, mapOptions);
        var bounds = new google.maps.LatLngBounds();
        for (var i = 0; i < housings.length; ++i) {
            var markerOptions = {
                position: new google.maps.LatLng(housings[i].latitude, housings[i].longitude),
                map: housingMap,
                icon: 'images/icons/gmap-icon-bed.png'
            }
            var marker = new google.maps.Marker(markerOptions);
            bounds.extend(marker.getPosition());
            marker.setTitle(housings[i].name);
            var infoWindowOptions = {
                content: housings[i].name
            }
            var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.open(housingMap, marker);
            });
        }
        housingMap.fitBounds(bounds);
    }
}//loadMap
