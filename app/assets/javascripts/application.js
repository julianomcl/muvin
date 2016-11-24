// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
map = null;
markers = [];
function getLocation() {
    initAutocomplete();
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(setPosition, showError);
    }
}
function setPosition(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var latlon = new google.maps.LatLng(lat, lon);
    var mapholder = $('mapholder');

    console.log("Latitude: " + lat);
    console.log("Longitude: " + lon);
    $.ajax({
        type: "POST",
        url: "http://localhost:3000/locations",
        cache: false,
        data: {
            location: {
                latitude: lat,
                longitude: lon
            }
        },
        success: function(){

        },
        error: function(){

        }
    });

    markers.push(new google.maps.Marker({
        map: map,
        title: "Você está aqui!",
        position: latlon
    }));
    map.setZoom(14);
    map.panTo(latlon);
}
function showError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("Usuário rejeitou a solicitação de Geolocalização.");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("Localização indisponível.");
            break;
        case error.TIMEOUT:
            alert("O tempo da requisição expirou.");
            break;
        case error.UNKNOWN_ERROR:
            alert("Algum erro desconhecido aconteceu.");
            break;
    }
}
function initAutocomplete() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -14.235004, lng: -51.92527999999999},
        zoom: 4,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    mapListeners();
}

function mapListeners(){
    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
        searchBox.setBounds(map.getBounds());
    });

    // var markers = [];
    // [START region_getplaces]
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
            return;
        }

        // Clear out the old markers.
        markers.forEach(function(marker) {
            marker.setMap(null);
        });
        markers = [];

        // For each place, get the icon, name and location.
        bounds = new google.maps.LatLngBounds();
        places.forEach(function(place) {

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
                map: map,
                title: place.name,
                position: place.geometry.location
            }));

            console.log("Latitude: " + place.geometry.location.lat());
            console.log("Longitude: " + place.geometry.location.lng());

            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
    // [END region_getplaces]
}
