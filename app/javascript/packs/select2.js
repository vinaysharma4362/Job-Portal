document.addEventListener("turbolinks:load", function(){
  $("#location").select2({
    theme: "bootstrap",
    width: '196px'
  });

  $("#job_title").select2({
    theme: "bootstrap"
  });
})