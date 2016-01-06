var geocoder;

function gmapShow(rawMarkers) {
  var mapOptions = { mapTypeId: google.maps.MapTypeId.HYBRID };
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: mapOptions,
    internal: {
      id: 'map-canvas'
    }}, function(){
    markers = handler.addMarkers(rawMarkers);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(10);
  });
}

function gmapShowMultiMarkers(rawMarkers) {
  var mapOptions = { mapTypeId: google.maps.MapTypeId.HYBRID };
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: mapOptions,
    internal: {
      id: 'map-canvas-multi-markers'
    }}, function(){
    markers = handler.addMarkers(rawMarkers);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(10);
  });
}
