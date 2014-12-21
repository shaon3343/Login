<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple Polylines</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
// This example creates a 2-pixel-wide red polyline showing
// the path of William Kingsford Smith's first trans-Pacific flight between
// Oakland, CA, and Brisbane, Australia.


function initialize() {
  var mapOptions = {
    zoom: 3,
 //   center: new google.maps.LatLng(0, -180),
 	center: new google.maps.LatLng( 22.755920681486405,91.845703125),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var flightPlanCoordinates = [
   // new google.maps.LatLng(37.772323, -122.214897),
   new google.maps.LatLng(21.401933838235188, 39.83642578125),
    
  ];
  var flightPath = new google.maps.Polyline({
    path: flightPlanCoordinates,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  var flag=0;
  google.maps.event.addListener(map, 'click', function( event ){
	//	alert( "Latitude: "+event.latLng.lat()+" "+", longitude: "+event.latLng.lng() ); 
	//	flightPlanCoordinates.push(new google.maps.LatLng(event.latLng.lat(),event.latLng.lng()));
//	flightPlanCoordinates = [];
	//flightPlanCoordinates.push(new google.maps.LatLng(21.401933838235188, 39.83642578125));
	flightPlanCoordinates.push(new google.maps.LatLng(event.latLng.lat(),event.latLng.lng()));
	
		if(flag==0){
			flag++;
			// flightPath.setMap(null);
			 var flightPath = new google.maps.Polyline({
				    path: flightPlanCoordinates,
				    geodesic: true,
				    strokeColor: '#FF0000',
				    strokeOpacity: 1.0,
				    strokeWeight: 2
				  });
			
			flightPath.setMap(map);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);


    </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div id="map-canvas"></div>
</body>
</html>