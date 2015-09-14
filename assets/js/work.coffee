isMobileDevice = ->
  (typeof window.orientation isnt "undefined") or (navigator.userAgent.indexOf("IEMobile") isnt -1)

$(document).on "ready page:load", ->

  $(".projects ul li").click ->
    window.location = $("a", this).attr("href")
    false

  if isMobileDevice().toString() is "false"
  else
    $('.case-study-header video').hide()
