function	loadMap(pageUri, queryString)
{
    var mapElement = $('gmap');
    if (!mapElement)
        return ;
    new Ajax.Request(pageUri+'.json?'+queryString, {
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
            var marker = new MarkerWithLabel({
                position: new google.maps.LatLng(housings[i].latitude, housings[i].longitude),
                map: housingMap,
                icon: 'images/icons/'+icons[housings[i].housingType]+'.png',
                labelContent: housings[i].numberPlaces+1,
                labelAnchor: new google.maps.Point(25, 55),
                labelClass: "gmap-icons-labels", // the CSS class for the label
                labelInBackground: false
            });

//            var markerOptions = {
//                position: new google.maps.LatLng(housings[i].latitude, housings[i].longitude),
//                map: housingMap,
//                icon: 'images/icons/'+icons[housings[i].housingType]+'.png'
//            }
//            var marker = new google.maps.Marker(markerOptions);
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
            0: {// This style will be used for clusters with more than 0 markers
                image: 'images/icons/gmap-icon-group.png',
                textColor: '#FFFFFF',
                width: 46,
                height: 52,
                lineHeight: 45 //XXX west coast custom parameter added into Fluster2ClusterMarker.prototype.draw (packed)
            }
        };
        fluster.initialize();
    }//placeMap
}//loadMap
