$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initializeGoogleMap);
});


function initializeGoogleMap() {
    var mapOptions = {
      center: new google.maps.LatLng(27.173373, 78.037209),
      zoom: 16
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
  }
