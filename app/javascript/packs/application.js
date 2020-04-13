// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("jquery")

require("@rails/ujs").start()
require("turbolinks").start()
require('@client-side-validations/client-side-validations')
require("@rails/activestorage").start()
require("channels")



require("jquery-ui")
require("packs/owl.carousel.min")

require("packs/bootstrap-datepicker")
require("packs/bootstrap.min")
require("packs/jquery.animateNumber.min")
require("packs/jquery.easing.1.3")
require("packs/jquery.magnific-popup.min")

require("packs/jquery.min")

require("packs/jquery.stellar.min")

require("packs/jquery.waypoints.min")

require("packs/jquery.raty")

require("packs/range")

require("packs/main")


require("packs/scrollax.min")

require("packs/select2")

// require ("packs/jquey.raty")
import "bootstrap";
var AOS = require('aos');
AOS.init();


$(document).ready(function () {
  $(".alert").delay(2000).slideUp(300);
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)