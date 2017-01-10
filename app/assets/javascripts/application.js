// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require turbolinks
//= require materialize-sprockets
//= require ckeditor/init
//= require cocoon
//= require toastr
//= require_tree .
$(document).ready(function() {
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('.collapsible').collapsible();
  $("#auto").autocomplete({
    source: '/suggestions/autocomplete_user_school'});
  $("#auto_school").autocomplete({
    source: '/suggestions/autocomplete_school_name'});
  $("#auto_country").autocomplete({
    source: '/suggestions/autocomplete_country_name'});
  $("#auto_country2").autocomplete({
    source: '/suggestions/autocomplete_country_name'});
  $('.slider').slider({full_width: true, interval:12000000});
  $('.slider').slider('pause');
  // Start slider
  $('.slider').slider('start');
  // Next slide
  $('.slider').slider('next');
  // Previous slide
  $('.slider').slider('prev');
  $('.carousel.carousel-slider').carousel({full_width: true});
  $('.carousel').carousel({dist:0,time_constant:1000,full_width:true});

});
