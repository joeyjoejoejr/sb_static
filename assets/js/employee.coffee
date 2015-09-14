$(document).on "ready page:load", ->
  $(".people ul li").click ->
    window.location = $("a", this).attr("href")
    false
