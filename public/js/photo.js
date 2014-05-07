$(document).ready(function() {
    google.maps.event.addDomListener(window, 'load', initializePhotoMap);
});


function initializePhotoMap() {
    var latitude = document.getElementById('latitude').innerText
    var longitude = document.getElementById('longitude').innerText
    var offsetMarkerLongitude = parseFloat(longitude) - 9

    var mapCenter = new google.maps.LatLng(latitude, offsetMarkerLongitude)
    var markerPoint = new google.maps.LatLng(latitude, longitude)

    var map = new google.maps.Map(document.getElementById("map-canvas"), {
        center: mapCenter,
        zoom: 6,
        mapTypeId: google.maps.MapTypeId.HYBRID
    });

    var featuredPicture = document.getElementById('my-photo').querySelector('img')

    var image = {
        url: featuredPicture.src,
        scaledSize: new google.maps.Size(featuredPicture.width * .1, featuredPicture.height * .1)
    }

    var marker = new google.maps.Marker({
        position: markerPoint,
        map: map,
        title: 'Hampi',
        icon: image,
        animation: google.maps.Animation.DROP
    });
}