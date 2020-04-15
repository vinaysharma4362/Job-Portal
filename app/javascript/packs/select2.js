$(document).on('turbolinks:before-cache', function() { 
  $('#location').select2('destroy');
  $('#job_title').select2('destroy');
} );
document.addEventListener("turbolinks:load", function(){

  $("#location").select2({
    theme: "bootstrap",
    width: '196px'
  });

  $("#job_title").select2({
    theme: "bootstrap"
  });
})