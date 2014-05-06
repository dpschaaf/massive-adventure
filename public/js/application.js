$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initializeGoogleMap);
});


function initializeGoogleMap() {
    var latitude = document.getElementById('latitude').innerText
    var longitude = document.getElementById('longitude').innerText
    var mapOptions = {
      center: new google.maps.LatLng(latitude, longitude),
      zoom: 16
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
  }
