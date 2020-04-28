$(document).on('turbolinks:before-cache', function() {
  $('#star-rating').raty('destroy');
  $('.star-rating').raty('destroy');
  } );
document.addEventListener("turbolinks:load", function(){

  $('#job_post_last_apply_date').datepicker({
    minDate:new Date(),
    dateFormat: "dd-mm-yy"
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