$(document).ready(function() {
  var hide_notice = function() {
    $('.fullscreen').fadeOut(2000, function(e) {
      $(this).remove();
    });
  }

  setTimeout(hide_notice, 3000);

  // $('form[data-remote=true]').on('ajax:success', function(e, data){
  //   $('body').append('<div class="fullscreen"><p class="alert alert-info alert-dismissible">'+data.message+'<button type="button" class="close">&times;</button></p></div>');
  //   setTimeout(hide_notice, 3000);
  // });

});