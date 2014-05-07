$(document).ready(function() {
    window.onload(initializeAlbum)
});

var initializeAlbum = function() {
    console.log('Album initialized')
    var request = $.ajax({
        url: '/albums/1',
        type: 'get'
    })

    request.done(displayMapsAlbum)
}

var displayMapsAlbum = function(album_info) {
    console.log('received data')

    var parsedDate = JSON.parse(album_info)
    var album = parsedDate['album']
    var photos = parsedDate['photos']

    console.log(album)
    console.log(photos)
}