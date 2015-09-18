$(document).on "ready page:load", ->
  $.getJSON "http://api.dribbble.com/players/smashingboxes/shots?callback=?"
    .done (data) ->
      shots = data.shots.slice 0, 3
      for shot in shots
        $("#dribbble-container ul").append "<li class=\"item\"><a href=#{shot.url} target=\"_blank\"><img src=\"#{shot.image_url}\"></a></li>"

  windowsize = $(this).width()
  if windowsize > 640
    $(".services").waypoint ((direction) ->
      $(".fade1").addClass "fade-in one"
      $(".fade2").css
        "margin-left": "1.5rem"
        transition: "all 1.5s ease"
      $(".fade4").css
        "margin-left": "0"
        transition: "all 1.5s ease"
      $(".fade3, .fade5").addClass "fade-in two"
      $('.services .intro').css
        "margin-left": "0"
      $(".fade3").css
        "margin-left": "1.5rem"
        transition: "all 1.5s ease"
      ),
        offset: 300
