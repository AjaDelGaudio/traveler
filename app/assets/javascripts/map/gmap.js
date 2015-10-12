var map;
var geocoder;
// var address = "San Diego, CA";

function initMap() {
  map = new google.maps.Map(document.getElementById('map-container'), {
    center: {lat: 43.825592, lng: 87.616848},
    zoom: 2,
    mapTypeId: google.maps.MapTypeId.HYBRID
  });




}
