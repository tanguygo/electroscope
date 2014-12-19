$(document).ready(function() {
  var hide_notice = function() {
    $('.fullscreen').fadeOut(2000, function(e) {
      $(this).remove();
    });
  }

  setTimeout(hide_notice, 3000);
});