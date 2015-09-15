$(document).on "page:change", ->
  window.optimizely = window.optimizely or []
  if window.ga isnt null
    window.optimizely.push ["activateUniversalAnalytics"]
    ga "set", "location", location.href.split("#")[0]
    ga "send", "pageview"
  else pageTracker._trackPageview()  if window.pageTracker isnt null

