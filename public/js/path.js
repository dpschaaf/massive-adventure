$(document).ready(function() {
        google.maps.event.addDomListener(window, 'load', initialize);
    }

    function initialize() {
        var mapOptions = {
            zoom: 5,
            center: new google.maps.LatLng(15.3129434, 91.0487172),
            mapTypeId: google.maps.MapTypeId.TERRAIN
        };

        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

        var flightPlanCoordinates = [
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
        var flightPath = new google.maps.Polyline({
            path: flightPlanCoordinates,
            geodesic: true,
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 2
        });

        flightPath.setMap(map);
    }