window.jQuery = window.$ = require "jquery"
require "jquery.easing"
require "../../node_modules/foundation-sites/js/foundation/foundation"
require "../../node_modules/foundation-sites/js/foundation/foundation.clearing"
require "../../node_modules/foundation-sites/js/foundation/foundation.reveal"
require "../../node_modules/foundation-sites/js/foundation/foundation.dropdown"
require "./vendor/purl"
require "../../node_modules/waypoints/lib/jquery.waypoints"
require "./vendor/accordion"
require "./home"
require "./menu"
require "./blog_posts"
require "./employee"
require "./jobs"
require "./work"
require "./vendor/google_analytics"
require "./vendor/crazyegg"
require "./vendor/owl.carousel"
require "./sliders"
require "./vendor/froogaloop.min"
require "./vendor/vimeo_track"

$(document).on "click", ".pagination a[data-remote=true]", (e) ->
  history.pushState {}, "", $(this).attr("href")

$(window).on "popstate", ->
  $.get document.location.href

$(window).scroll ->
  if navigator.platform != 'iPad' || navigator.platform != 'iPhone' || navigator.platform != 'iPod'
    oVal = $(window).scrollTop() / 240
    $(".blur").css
      opacity: oVal
      "background-color": "#000"

$(document).on "ready page:load", ->
  $newsLetter = $('#newsletter')
  $newsLetterEmail = $('.newsletter-email')
  $newsLetterStatus = null
  doc = document.documentElement
  doc.setAttribute "data-useragent", navigator.userAgent

  newsLetter =
    init: ->
      $newsLetter.on "ajax:success", (e, data, status, xhr) ->
        newsLetter.handler(data.success)
        $modal = $('.successModal')

        lazy_loaded_image = $modal.find('img').data('src')
        $modal.find('img').attr('src', lazy_loaded_image)
        
        $modal.foundation('reveal', 'open');
        $modal.find('p')
          .delay 3500
          .animate
            opacity: 1,
          , 400

      $newsLetter.on "ajax:error", (e, data, status, error) ->
        newsLetter.handler('Pump your brakes, you need to enter an email!')


    handler: (message) ->
      $newsLetterStatus.remove() if $newsLetterStatus
      $newsLetterStatus = $ "<p id='newsletter_status'>#{message}</p>"
      
      $newsLetter.append $newsLetterStatus
      
      $newsLetterStatus
        .delay 2000
        .fadeOut 400

      $('.newsletter-email').val('')

  newsLetter.init()

  swapSrc = (img, hover = '') ->
    $(this).children('img').attr 'src', '/assets/' + img + hover + '.png'
  ['prev', 'close', 'next'].forEach (img) ->
    $('a.image-' + img).on
      mouseenter: ->
        swapSrc.call(this, img, '_hover')
      mouseleave: ->
        swapSrc.call(this, img)

  swapLogo = ->
    $logo = $("header .logo i")

    windowSize = $(window).width()
    if windowSize < 640
      $logo.removeClass("icon-sb-logo").addClass "icon-sb-mark"
    else
      $logo.removeClass("icon-sb-mark").addClass "icon-sb-logo"

  swapLogo()

  if navigator.userAgent.toLowerCase().indexOf("chrome") >= 0
    $(window).load ->
      $("input:-webkit-autofill").each ->
        text = $(this).val()
        name = $(this).attr("name")
        $(this).after(@outerHTML).remove()
        $("input[name=" + name + "]").val text

  $(window).resize Foundation.utils.debounce(swapLogo, 300)
  
  # Fix google plus link to open in browser instead of app on iOS devices
  if navigator.platform == 'iPad' || navigator.platform == 'iPhone' || navigator.platform == 'iPod'
    $('.gplus a').attr 'href', 'https://plus.google.com/app/basic/104372841961490774641'
  else
    $('.gplus a').attr 'href', 'https://plus.google.com/+Smashingboxes'

  $(document).foundation()
  $(document).Menu()
