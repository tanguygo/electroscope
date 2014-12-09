function initializeAutocomplete(id,prefix) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      onPlaceChanged(this, prefix)
    });
  }
}

function onPlaceChanged(that, prefix) {
  var place = that.getPlace();

  // console.log(place);  // Uncomment this line to view the full object returned by Google API.

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type_element = document.getElementById(prefix+component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
    }
  }
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('order_autocomplete_address',"order_");
});