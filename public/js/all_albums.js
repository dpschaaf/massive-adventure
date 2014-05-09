$(document).ready(function() {
    window.onload = initializeCollage
});

var initializeCollage = function() {
    var request = $.ajax({
        url: '/albums/all',
        type: 'get'
    })

    request.done(initializeAlbumsCollage)
}

var initializeAlbumsCollage = function(albums) {

    var mapOptions = {
        zoom: 4,
        center: new google.maps.LatLng(15.3129434, 91.0487172),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions); // no var means global scope

    setAlbumMarkers(map, albums)
}

var setAlbumMarkers = function(map, albums) {

    for (var i in albums) {
        var current_album = albums[i][0];
        var myLatLng = new google.maps.LatLng(current_album.latitude,
            current_album.longitude);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: current_album.title,
            icon: {
                url: albums[i][1],
                scaledSize: new google.maps.Size(65, 43)
            }
        })
        marker.setValues({
            type: "point",
            id: i
        });

        google.maps.event.addListener(marker, 'click', initializeAlbum.bind(marker))
    };
}

//albums.js
var initializeAlbum = function() {
    var request = $.ajax({
        url: window.location + '/' + this.id + '/photos',
        type: 'get'
    })

    request.done(displayAlbumMap.bind(this))
}

var displayAlbumMap = function(album_info) {
    var album = JSON.parse(album_info['album'])
    var photos = JSON.parse(album_info['photos'])

    initializeAlbumMap(album, photos, this.position)
}


var initializeAlbumMap = function(album, photos, position) {
    map.setZoom(16);
    map.setCenter(position);

    setPhotoMarkers(map, photos)
}

var setPhotoMarkers = function(map, photos) {
    console.log()
    for (var i in photos) {
        var current_photo = photos[i];
        var myLatLng = new google.maps.LatLng(current_photo.latitude,
            current_photo.longitude);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: current_photo.id,
            icon: {
                url: current_photo.url,
                scaledSize: new google.maps.Size(65, 43)
            }
        })
        marker.setValues({
            type: "point",
            id: i
        });

        google.maps.event.addListener(marker, 'click', getPhotoSource.bind(marker))
    };
}

var getPhotoSource = function() {

    var request = $.ajax({
        url: '/photos/' + this.id,
        type: 'get'
    })

    request.done(showPhotoView.bind(this))
}

var showPhotoView = function(pictureData) {
    var latitude = this.position.k
    var longitude = this.position.A
    var offsetMarkerLongitude = parseFloat(longitude) - 9

    var mapCenter = new google.maps.LatLng(latitude, offsetMarkerLongitude)
    var markerPoint = new google.maps.LatLng(latitude, longitude)

    map.setZoom(6);
    map.setCenter(mapCenter);

    var pictureDiv = document.createElement('div')
    pictureDiv.id = 'my-photo'

    var picture = document.createElement('img')
    picture.src = pictureData.url

    pictureDiv.appendChild(picture)
    document.body.appendChild(pictureDiv)
}