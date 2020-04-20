// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("packs/aos")
require("jquery")

require("@rails/ujs").start()
require("turbolinks").start()
require('@client-side-validations/client-side-validations')
require("@rails/activestorage").start()
require("channels")



require("jquery-ui")
require("packs/select2")
require("select2")
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

require("packs/scrollax.min")
require("packs/search")
require("trix")
require("@rails/actiontext")

import 'cocoon-js';
import "bootstrap";

$(document).ready(function () {
  $(".alert").delay(2000).slideUp(300);
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Self Initialize DOM Factory Components
domFactory.handler.autoInit()

// Connect button(s) to drawer(s)
var sidebarToggle = Array.prototype.slice.call(document.querySelectorAll('[data-toggle="sidebar"]'))

sidebarToggle.forEach(function (toggle) {
  toggle.addEventListener('click', function (e) {
    var selector = e.currentTarget.getAttribute('data-target') || '#default-drawer'
    var drawer = document.querySelector(selector)
    if (drawer) {
      drawer.mdkDrawer.toggle()
    }
  })
})


let drawers = document.querySelectorAll('.mdk-drawer')
drawers = Array.prototype.slice.call(drawers)
drawers.forEach((drawer) => {
  drawer.addEventListener('mdk-drawer-change', (e) => {
    if (!e.target.mdkDrawer) {
      return
    }
    document.querySelector('body').classList[e.target.mdkDrawer.opened ? 'add' : 'remove']('has-drawer-opened')
    let button = document.querySelector('[data-target="#' + e.target.id + '"]')
    if (button) {
      button.classList[e.target.mdkDrawer.opened ? 'add' : 'remove']('active')
    }
  })
})

// ENABLE TOOLTIPS
$('[data-toggle="tooltip"]').tooltip()
