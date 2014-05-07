$(document).ready(function() {
    // google.maps.event.addDomListener(window, 'load', setBackgroundImage);
    google.maps.event.addDomListener(window, 'load', initializeGoogleMap);
    // google.maps.event.addListener(marker, 'click', toggleBounce)

});


// function setBackgroundImage() {
//     var imgUrl = document.getElementById("url").innerText
//     document.querySelector('body').style.backgroundImage = "url(" + imgUrl + ")"
// }

function initializeGoogleMap() {
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



// function toggleBounce() {
//     if (marker.getAnimation() != null) {
//         marker.setAnimation(null);
//     } else {
//         marker.setAnimation(google.maps.Animation.BOUNCE);
//     }
// }


var latLng = new google.maps.LatLng(49.47805, -123.84716);
var homeLatLng = new google.maps.LatLng(49.47805, -123.84716);

var map = new google.maps.Map(document.getElementById('map_canvas'), {
    zoom: 12,
    center: latLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
});

var pictureLabel = document.createElement("img");
pictureLabel.src = "home.jpg";

var marker = new MarkerWithLabel({
    position: homeLatLng,
    map: map,
    draggable: true,
    labelContent: pictureLabel,
    labelAnchor: new google.maps.Point(50, 0),
    labelClass: "labels", // the CSS class for the label
    labelStyle: {
        opacity: 0.50
    }
});

var iw = new google.maps.InfoWindow({
    content: "Home For Sale"
});
google.maps.event.addListener(marker, "click", function(e) {
    iw.open(map, marker);
});