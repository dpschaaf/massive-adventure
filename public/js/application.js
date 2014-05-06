$(document).ready(function() {
    // google.maps.event.addDomListener(window, 'load', setBackgroundImage);
    // google.maps.event.addDomListener(window, 'load', initializeGoogleMap);
    // google.maps.event.addListener(marker, 'click', toggleBounce)
});


function setBackgroundImage() {
    var imgUrl = document.getElementById("url").innerText
    document.querySelector('body').style.backgroundImage = "url(" + imgUrl + ")"
}

function initializeGoogleMap() {
    var latitude = document.getElementById('latitude').innerText
    var longitude = document.getElementById('longitude').innerText
    // var offsetMarkerLongitude = parseFloat(longitude) - 0.01
    var mapCenter = new google.maps.LatLng(latitude, longitude)
    var markerPoint = new google.maps.LatLng(latitude, longitude)

    var map = new google.maps.Map(document.getElementById("map-canvas"), {
        center: mapCenter,
        zoom: 4
    });

    // var image = {
    //     url: document.getElementById('my-photo').querySelector('img').src,
    //     size: new google.maps.Size(384, 256),
    //     origin: new google.maps.Point(0, 0),
    //     anchor: new google.maps.Point(0, 256)
    // }

    var marker = new google.maps.Marker({
        position: markerPoint,
        map: map,
        title: 'Hampi',
        // icon: image,
        animation: google.maps.Animation.DROP
    });
}

function toggleBounce() {
    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
    } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}