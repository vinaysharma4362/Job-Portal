document.addEventListener("turbolinks:load", function(){
  $("#location").select2({
    theme: "bootstrap",
    height: '196px'
  });

  $("#job_title").select2({
    theme: "bootstrap"
  });

  $('#job_post_last_apply_date').datepicker({
    format: "dd-mm-yyyy",
    autoclose: true,
    startDate: 'd'
    });
})