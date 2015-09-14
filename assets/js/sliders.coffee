centerSlide = ->
  bg = $('.background')
  bWidth = bg.width()
  wWidth = $(window).width()
  if wWidth < 640
    bg.css('margin-left', wWidth / 2 - (bWidth / 2))
  else
    bg.css('margin', 'auto')

initBannerSlides = ->
  $(".banner-carousel").owlCarousel({
    navigation: true,
    autoplay: true,
    loop: true,
    dots: true,
    slideSpeed: 1,
    paginationSpeed: 400,
    items: 1,
    singleItem: true,
    # These options should be implicit in singleItem according to the
    # owl docs but that does not appear to be working with this owl version.
    itemsDesktop: false,
    itemsDesktopSmall: false,
    itemsTablet: false,
    itemsMobile: false
  })

initSlide = ->
  activateSlide = undefined

  $('.js-slider').each (i, id) ->

    $slide = $(id).find('.slide')
    $(id).find('.slide:not(:first)').hide()

    if $slide.length == 1
      activateSlide = false
    else
      activateSlide = true

  if activateSlide
    Foundation.utils.image_loaded $('.background'), ->
      centerSlide()

      $('.js-slider').each (i, id) ->
        $(id).find('.slide:not(:first)').show()
        owl = $(id)
        owl.owlCarousel
          items: 1
          margin: 0
          loop: true
          nav: true
          navText: ["<i class='icon-sb-slider-arrow-left'></i>","<i class='icon-sb-slider-arrow-right'></i>"]
          responsiveRefreshRate: 10
          autoHeight: true
          lazyLoad: true

$(document).on "ready page:load", (e) ->
  initSlide()
  initBannerSlides()

$(window).on "load", initSlide
$(window).on 'resize', centerSlide
