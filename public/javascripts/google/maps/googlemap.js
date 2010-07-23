function	loadMap(pageUri, queryString)
{
    var mapElement = $('gmap');
    if (!mapElement)
        return ;

    // Utility functions
    function putLoading() {
        putMessage('<img src="images/gmap-loading.gif" class="gmessage" />');
    }

    function logError(info) {
        try { console.log('Google Map : '+info); } catch(e) { console = { log: function() {} } }
    }

    function putError(info) {
        if (info)
            info = ' ('+info+')';
        putMessage('<span class="gmessage">Error'+info+'</span>');
    }

    function putMessage(content) {
        mapElement.update(content);
    }
    // END Utility functions

    // GMap functions
    function placeMap(housings)
    {
        var icons = new Array();
        icons["h"] = 'gmap-icon-house';
        icons["b"] = 'gmap-icon-bed';
        var mapOptions = {
            zoom: 5,
            center: new google.maps.LatLng(46.943605722409444, 2.4922539062500038),
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

// Default Gmapv3 marker
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

        function makeInfoWindowContent(housing) {
            var content = '<div class="gmap-infowindow">';
            content += '<div id="housing-name">'+housing.name+'</div>';
            content += '<p>places : '+housing.numberPlaces+'</p>';
            content += '<a href="'+housing.linkView+'" title="Vois la fiche de '+housing.name+'">voir la fiche</a>';
            content += '</div>';
            return content;
        }

        function addInfoWindow(housing, marker) {
            var infoWindowOptions = {
                content: makeInfoWindowContent(housing)
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
    // END GMap functions

    // Ajax Execution
    new Ajax.Request(pageUri+'.json?'+queryString, {
        method: 'get',
        requestHeaders: {
            Accept: 'application/json'
        },
        onSuccess: function(transport){
            var response = transport.responseText || "no response text";
            if (response.isJSON()) {
                try {
                    response = response.evalJSON();
                    placeMap(response);
                } catch (e) {
                    putError('syntax');
                    logError('caught exception : '+e.message);
                }
            }
            else {
                putError('not json');
                logError('the data is not JSON !');
            }
        },
        onLoading: putLoading,
        onFailure: function(){
            putError('server');
            logError('server error !');
        }
    });//Ajax.Request
    // END Ajax Execution
}//loadMap
