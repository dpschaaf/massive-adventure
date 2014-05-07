$(document).ready(function() {
    google.maps.event.addDomListener(window, 'load', initializePath)
});


function initializePath() {

    var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(15.3129434, 91.0487172),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var travelPathCoordinates = [
        new google.maps.LatLng(37.621313, -122.378955), // SFO
        new google.maps.LatLng(1.3185848, 103.8455665), // Singapore
        new google.maps.LatLng(7.9034596, 98.2924807), // Phuket
        new google.maps.LatLng(1.3185848, 103.8455665), // Singapore
        new google.maps.LatLng(2.8064825, 104.1703345), // Pulau Tioman, Malaysia
        new google.maps.LatLng(1.3185848, 103.8455665), // Singapore
        new google.maps.LatLng(7.293038, 80.638506), // Sri Lanka
        new google.maps.LatLng(1.3185848, 103.8455665), // Singapore
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(1.3185848, 103.8455665), // Singapore
        new google.maps.LatLng(22.281032, 114.151355), // Hong Kong
        new google.maps.LatLng(1.3185848, 103.8455665), // Singapore
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(9.9639005, 76.2545944), // Kochi, Kerala
        new google.maps.LatLng(9.4828804, 76.3762234), // Alleppey, Kerala
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(15.3331898, 76.4633347), // Hampi
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(11.350517, 76.810497), // Coonor
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(11.5724717, 104.9289601), // Phnom Penh
        new google.maps.LatLng(13.3416274, 103.8629545), // Siem Reap
        new google.maps.LatLng(10.7603832, 103.2583631), // Koh Rong
        new google.maps.LatLng(11.5724717, 104.9289601), // Phnom Penh
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(26.9379439, 75.8592224), // Jaipur
        new google.maps.LatLng(27.175015, 78.042155), // Agra
        new google.maps.LatLng(28.6030523, 77.2423442), // Delhi
        new google.maps.LatLng(41.012732, 28.978713), // Istanbul
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(24.8522879, 79.9213288), // Khajuraho
        new google.maps.LatLng(12.951769, 77.665369), // Bangalore
        new google.maps.LatLng(12.0347219, 92.9990131), // Andaman Islands
        new google.maps.LatLng(12.9308681, 77.6280534), // Bangalore
        new google.maps.LatLng(13.7592371, 100.4972945), // Bangkok, Khaosan
        // new google.maps.LatLng(13.7592371, 100.4972945), // Bangkok, Kenny
        new google.maps.LatLng(17.014511, 99.822936), // Sukhothai
        new google.maps.LatLng(18.7919774, 98.9913353), // Chiang Mai
        new google.maps.LatLng(16.7991704, 96.14624), // Yangon
        new google.maps.LatLng(21.185197, 94.886556), // Bagan
        new google.maps.LatLng(20.6583147, 96.9313623), // Inle Lake
        new google.maps.LatLng(20.4484457, 99.8872393), // Tachileik
        new google.maps.LatLng(19.9029292, 99.8365673), // Chiang Rai
        new google.maps.LatLng(20.2743301, 100.4048031), // Chiang Khong
        new google.maps.LatLng(20.2731582, 100.4148764), // Huay Xai
        new google.maps.LatLng(19.8947774, 102.1415019), // Luang Prabang
        new google.maps.LatLng(21.0360092, 105.8503477), // Hanoi
        new google.maps.LatLng(20.9461867, 107.0031452), // Ha Long Bay
        new google.maps.LatLng(15.888631, 108.3450479), // Hoi An
        new google.maps.LatLng(21.0360092, 105.8503477), // Hanoi
        new google.maps.LatLng(22.281032, 114.151355), // Hong Kong
        new google.maps.LatLng(37.621313, -122.378955) // SFO
    ];

    var travelPath = new google.maps.Polyline({
        path: travelPathCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });

    travelPath.setMap(map);
    setMarkers(map, travelPathMarkers)

}

var travelPathMarkers = [
    ["SFO", 37.621313, -122.378955, 1],
    ["Singapore", 1.3185848, 103.8455665, 2],
    ["Phuket", 7.9034596, 98.2924807, 3],
    ["Singapore", 1.3185848, 103.8455665, 4],
    ["Pulau Tioman, Malaysia", 2.8064825, 104.1703345, 5],
    ["Singapore", 1.3185848, 103.8455665, 6],
    ["Sri Lanka", 7.293038, 80.638506, 7],
    ["Singapore", 1.3185848, 103.8455665, 8],
    ["Bangalore", 12.9308681, 77.6280534, 9],
    ["Singapore", 1.3185848, 103.8455665, 10],
    ["Hong Kong", 22.281032, 114.151355, 11],
    ["Singapore", 1.3185848, 103.8455665, 12],
    ["Bangalore", 12.9308681, 77.6280534, 13],
    ["Kochi, Kerala", 9.9639005, 76.2545944, 14],
    ["Alleppey, Kerala", 9.4828804, 76.3762234, 15],
    ["Bangalore", 12.9308681, 77.6280534, 16],
    ["Hampi", 15.3331898, 76.4633347, 17],
    ["Bangalore", 12.9308681, 77.6280534, 18],
    ["Coonor", 11.350517, 76.810497, 19],
    ["Bangalore", 12.9308681, 77.6280534, 20],
    ["Phnom Penh", 11.5724717, 104.9289601, 21],
    ["Siem Reap", 13.3416274, 103.8629545, 22],
    ["Koh Rong", 10.7603832, 103.2583631, 23],
    ["Phnom Penh", 11.5724717, 104.9289601, 24],
    ["Bangalore", 12.9308681, 77.6280534, 25],
    ["Jaipur", 26.9379439, 75.8592224, 26],
    ["Agra", 27.175015, 78.042155, 27],
    ["Delhi", 28.6030523, 77.2423442, 28],
    ["Istanbul", 41.012732, 28.978713, 29],
    ["Bangalore", 12.9308681, 77.6280534, 30],
    ["Khajuraho", 24.8522879, 79.9213288, 31],
    ["Bangalore", 12.951769, 77.665369, 32],
    ["Andaman Islands", 12.0347219, 92.9990131, 33],
    ["Bangalore", 12.9308681, 77.6280534, 34],
    ["Bangkok, Khaosan", 13.7592371, 100.4972945, 35],
    ["Sukhothai", 17.014511, 99.822936, 36],
    ["Chiang Mai", 18.7919774, 98.9913353, 37],
    ["Yangon", 16.7991704, 96.14624, 38],
    ["Bagan", 21.185197, 94.886556, 39],
    ["Inle Lake", 20.6583147, 96.9313623, 40],
    ["Tachileik", 20.4484457, 99.8872393, 41],
    ["Chiang Rai", 19.9029292, 99.8365673, 42],
    ["Chiang Khong", 20.2743301, 100.4048031, 43],
    ["Huay Xai", 20.2731582, 100.4148764, 44],
    ["Luang Prabang", 19.8947774, 102.1415019, 45],
    ["Hanoi", 21.0360092, 105.8503477, 46],
    ["Ha Long Bay", 20.9461867, 107.0031452, 47],
    ["Hoi An", 15.888631, 108.3450479, 48],
    ["Hanoi", 21.0360092, 105.8503477, 49],
    ["Hong Kong", 22.281032, 114.151355, 50],
    ["SFO", 37.621313, -122.378955, 51]
];

function setMarkers(map, locations) {

    for (var i = 0; i < locations.length; i++) {
        var destination = locations[i];
        var myLatLng = new google.maps.LatLng(destination[1], destination[2]);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: destination[0],
            zIndex: destination[3]
        });
    }
}