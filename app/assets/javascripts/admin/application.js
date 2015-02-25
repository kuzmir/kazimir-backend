//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require admin/map

$(document).on("page:change", function(){
  Kzmr.Map.init();
})
