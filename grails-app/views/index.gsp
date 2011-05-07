    <head>
        <title>qplayas 1.0</title>
        <meta name="layout" content="main" />

        <script src="http://www.google.com/jsapi?key=ABQIAAAAiu9_AEv3oDQ1vpv7Cwzl3hQ6G5fnyU1LjnMSvbaPRvBm1Ex-phQAvZ8nHM4NnCPbo5mae02BkAvv6g" type="text/javascript"></script>

        <script type="text/javascript">
            google.load("maps", "2.x");
            google.load("jquery", "1.3.1");
            
            google.setOnLoadCallback(function() {
                $(document).ready(function() {
                    var map = new GMap2(document.getElementById('map'));
                    var mapTypeControl = new GMapTypeControl();
                    var topRight = new GControlPosition(G_ANCHOR_TOP_RIGHT, new GSize(10,10));
                    var bottomRight = new GControlPosition(G_ANCHOR_BOTTOM_RIGHT, new GSize(10,10));
                    map.addControl(mapTypeControl, topRight);
                    map.addControl(new GLargeMapControl());
                    //Localizacion de España
                    map.setCenter(new GLatLng(39.690281,-3.251953), 6);

                    //Añade un punto en el mapa
                    function createMarker(point) {
                    	// Create our "tiny" marker icon
                    	var blueIcon = new GIcon(G_DEFAULT_ICON);
                    	blueIcon.image = "http://www.masvigo.com/public/images/ico/maps/icoSombrilla.png";
                    	                
                       //opciones del punto: cambio de icono
                      markerOptions = { icon:blueIcon };
                  	  var marker = new GMarker(point,markerOptions);
                   	  GEvent.addListener(marker, "click", function() {
                  	    var myHtml = "Playa de arena blanca" + "<br/>  <IMG SRC='http://t2.gstatic.com/images?q=tbn:ANd9GcSt9sCxP1jbbM3PqBq9B1jjGjmbUVLNAgVV4nARjJGVhYw_y8fV' WIDTH=40 HEIGHT=70 BORDER=0>";
                  	    map.openInfoWindowHtml(point, myHtml);
                  	  });
                  	  
                  	  return marker;
                  	}
                    
                    // Añade puntos sobre el mapa de forma aleatoria
                    var bounds = map.getBounds();
                    var southWest = bounds.getSouthWest();
                    var northEast = bounds.getNorthEast();
                    var lngSpan = northEast.lng() - southWest.lng();
                    var latSpan = northEast.lat() - southWest.lat();
                    for (var i = 0; i < 20; i++) {
                      	var point = new GLatLng(southWest.lat() + latSpan * Math.random(),
                            southWest.lng() + lngSpan * Math.random());             						
	                    map.addOverlay(createMarker(point));
                    }                    
                });
            });
        </script>
    </head>
    <body>
     <div class="form">
            <form action="${createLink(controller: 'geoLocations', action: 'locationsBeach')}" id="locationBeachs">
                <p>
                    <label>Playa:</label>
                    <input type="text" id="name" name="name" value=""/>
                </p>
                <p class="submit">
                    <input type="submit" value="Buscar">
                </p>
            </form>
        </div>
        <div id="map" style="width:800px; height:600px">
        </div>
    </body>
</html>
