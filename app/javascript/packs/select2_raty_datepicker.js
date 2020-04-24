$(document).on('turbolinks:before-cache', function() {
  $('#location').select2('destroy');
  $('#job_title').select2('destroy');
  $('#star-rating').raty('destroy');
  $('.star-rating').raty('destroy');
  } );
document.addEventListener("turbolinks:load", function(){

  // $("#location").select2({
  //   theme: "bootstrap",
  //   height: '196px'
  // });

  // $("#job_title").select2({
  //   theme: "bootstrap"
  // });

  $('#job_post_last_apply_date').datepicker({
    format: "dd-mm-yyyy",
    autoclose: true,
    startDate: 'd'
  });

  $('.star-rating').raty({
    readOnly: true,
    score: function () {
      return $(this).attr('data-score');
    },
    path: '/assets/'
  });

  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
})