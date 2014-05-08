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
    zoom: 5,
    center: new google.maps.LatLng(15.3129434, 91.0487172),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  setAlbumMarkers(map, albums)
}

var setAlbumMarkers = function(map, albums) {

  for (var i in albums) {
    var current_album = albums[i];
    var myLatLng = new google.maps.LatLng(current_album.latitude,
      current_album.longitude);
    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: current_album.id,
      icon: {
        url: current_album.url,
        scaledSize: new google.maps.Size(65, 43)
      }
    })
    marker.setValues({type: "point", id: i});
    google.maps.event.addListener(marker, 'click', loadAlbumPage.bind(marker))
  };
}

var loadAlbumPage = function(event) {
  window.location = '/albums/'+this.id
 };
