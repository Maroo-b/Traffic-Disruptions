var map;
var Settings = {
  id: 'map',
  lat: 51.509865,
  lng: -0.119092,
  zoom: 12
};

function initMap() {

  map = new google.maps.Map(document.getElementById(Settings.id), {
    center: {lat: Settings.lat, lng: Settings.lng},
    zoom: Settings.zoom
  });

  var pins = $("#pins_data").data().pins;

  pins.forEach(function(item){
    var marker = new google.maps.Marker({
      position: {lat: item.lat, lng: item.lng},
      map: map
    });
  })
}
google.maps.event.addDomListener(window, "load", initMap);

