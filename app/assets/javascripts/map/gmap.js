function gmapShow(rawMarkers) {
  var mapOptions = { mapTypeId: google.maps.MapTypeId.HYBRID };
  var handler = Gmaps.build('Google');
  handler.buildMap({
    provider: mapOptions,
    internal: {
      id: 'map-canvas'
    }}, function(){
    var markers = handler.addMarkers(rawMarkers);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(8);
  });
}

function gmapShowMultiMarkers(rawMarkers) {
  var mapOptions = { mapTypeId: google.maps.MapTypeId.HYBRID };
  var handler = Gmaps.build('Google');
  handler.buildMap({
    provider: mapOptions,
    internal: {
      id: 'map-canvas-multi-markers'
    }}, function(){
    var markers = handler.addMarkers(rawMarkers);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(2);
  });
}
