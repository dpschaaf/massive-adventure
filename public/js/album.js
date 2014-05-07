$(document).ready(function() {
  window.onload = initializeAlbum
});

var initializeAlbum = function() {

  var request = $.ajax({
    url: '/albums/1',
    type: 'get'
  })

  request.done(displayAlbumMap)
}

var displayAlbumMap = function(album_info) {
  var album = JSON.parse(album_info['album'])
  var photos = JSON.parse(album_info['photos'])

  initializeAlbumMap(album, photos)
}


var initializeAlbumMap = function(album, photos) {

  var mapOptions = {
    zoom: 16,
    center: new google.maps.LatLng(album.latitude, album.longitude),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  setPhotoMarkers(map, photos)
}

var setPhotoMarkers = function(map, photos) {
  console.log(photos)
  for (var i in photos) {
    var current_photo = photos[i];
    var myLatLng = new google.maps.LatLng(current_photo.latitude,
      current_photo.longitude);
    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: current_photo.title,
      icon: {
        url: current_photo.url,
        scaledSize: new google.maps.Size(65, 43)
      }
    })
  };
}
