function	loadMap(pageUri, queryString)
{
    var mapElement = $('gmap');
    if (!mapElement)
        return ;
    new Ajax.Request(pageUri+'.json?options='+queryString, {
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
    });//Ajax.Request

    function    placeMap(housings)
    {
        var icons = new Array();
        icons["h"] = 'gmap-icon-house';
        icons["b"] = 'gmap-icon-bed';
        var mapOptions = {
            zoom: 6,
            center: new google.maps.LatLng(47.390251,0.688877),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var housingMap = new google.maps.Map(mapElement, mapOptions);
        // Initialize Fluster (marker clustering) and give it the existing map
        var fluster = new Fluster2(housingMap);

        var bounds = new google.maps.LatLngBounds();
        for (var i = 0; i < housings.length; ++i) {
            var markerOptions = {
                position: new google.maps.LatLng(housings[i].latitude, housings[i].longitude),
                map: housingMap,
                icon: 'images/icons/'+icons[housings[i].housingType]+'.png'
            }
            var marker = new google.maps.Marker(markerOptions);
            bounds.extend(marker.getPosition());
            marker.setTitle(housings[i].name);
            addInfoWindow(housings[i], marker);
            fluster.addMarker(marker);
        }

        function addInfoWindow(housing, marker) {
            var infoWindowOptions = {
                content: housing.name+'<br />places : '+housing.numberPlaces
            }
            var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.open(housingMap, marker);
            });
        }
        housingMap.fitBounds(bounds);

        fluster.styles = {
            // This style will be used for clusters with more than 0 markers
            0: {
                image: 'images/icons/gmap-icon-group.png',
                textColor: '#FFFFFF',
                width: 46,
                height: 52
            }
        };
        fluster.initialize();
    }//placeMap
}//loadMap
