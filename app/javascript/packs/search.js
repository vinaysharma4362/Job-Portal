document.addEventListener("turbolinks:load", function(){
  var job_title = document.getElementById("job_title");
  var job_type = document.getElementById("job_type");
  var location = document.getElementById("location");
  
  $("#search").on("click", function() {
        $.ajax({
          url: "/job_posts/search",
          type: "GET",
          data: { job_title: job_title.value, job_type: job_type.value, location: location.value }
        })
  });
})