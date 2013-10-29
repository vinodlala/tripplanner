# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
initialize_gmaps = ->

  # initialize new google maps LatLng object
  myLatlng = new google.maps.LatLng(40.705786, -74.007672)

  # set the map options hash
  mapOptions =
    center: myLatlng
    zoom: 16
    mapTypeId: google.maps.MapTypeId.ROADMAP


  # get the maps divs HTML obj
  map_canvas_obj = document.getElementById("map-canvas")

  # initialize a new Google Map with the options
  map = new google.maps.Map(map_canvas_obj, mapOptions)

  # Add the marker to the map
  marker = new google.maps.Marker(
    position: myLatlng
    title: "Hello World!"
  )

  # Add the marker to the map by calling setMap()
  marker.setMap map
$(document).ready ->
  initialize_gmaps()
