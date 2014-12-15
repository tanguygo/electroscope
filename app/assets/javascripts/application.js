//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.scrollme

//= require_tree .

// prevent user from submitting form by only validating google autocomplete field

$('.google-autocomplete').keypress(function(event){
    if (event.keyCode == 10 || event.keyCode == 13)
        event.preventDefault();
  });