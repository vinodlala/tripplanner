// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var current_marker; var map;

var initialize_gmaps = function(lat, lng, name) {
  var mapOptions, map_canvas_obj, myLatlng;
  myLatlng = new google.maps.LatLng(lat, lng);
  mapOptions = {
    center: myLatlng,
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map_canvas_obj = document.getElementById("map-canvas");
  map = new google.maps.Map(map_canvas_obj, mapOptions);
  current_marker = new google.maps.Marker({
    position: myLatlng,
    title: name
  });
  return current_marker.setMap(map);
};

// var add_marker = function(lat,lon,name) {
//   if(typeof name == "undefined") {
//     name = "";
//   }
//   var myLatlng = new google.maps.LatLng(lat, lon);
//   var next_marker = new google.maps.Marker({
//     position: myLatlng,
//     title: name
//   });
//   next_marker.setMap(map);
//   current_marker = next_marker;
// };

// var remove_marker = function() {
//   current_marker.setMap(null);
// };

var move_marker = function (myLatlng,name) {
  console.log('move marker called');
  // var myLatlng = new google.maps.LatLng(lat, lon);
  current_marker.setPosition(myLatlng);
  current_marker.setTitle(name);
};

$(document).ready(function() {
  return initialize_gmaps(40.705786, -74.007672, "Fullstack Academy");
});
