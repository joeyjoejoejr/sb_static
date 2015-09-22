$(document).on "ready page:load", ->
  runDribbble = (number) ->
    $.getJSON "http://api.dribbble.com/players/smashingboxes/shots?callback=?"
      .done (data) ->
        shots = data.shots.slice 0, number
        for shot in shots
          $("#dribbble-container ul").append "<li class=\"item\"><a href=#{shot.url} target=\"_blank\"><img src=\"#{shot.image_url}\"></a></li>"

  if $("#dribbble-container.short").length > 0
    runDribbble(3)

  if $("#dribbble-container.long").length > 0
    runDribbble(9)

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
