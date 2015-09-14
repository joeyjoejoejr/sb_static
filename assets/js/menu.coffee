$.fn.Menu = ->
  $(window).scroll ->
    scroll = $(window).scrollTop()
    if scroll > 50
      $(".dr-icon-bg").animate opacity: "0.5", 100  if $(".dr-icon-bg").css("opacity") is "0"
    else
      $(".dr-icon-bg").animate opacity: "0", 100  if $(".dr-icon-bg").css("opacity") is "0.5"

  $(".dr-menu").each ->
    trigger = $("div.dr-trigger", this)
    icon = trigger.find("a.dr-icon-menu", this)
    logo = $('.icon-sb-mark', this)
    menu = trigger.parent()
    max = 0
    open = false
    # $(this).find(".pink-menu").hide()
    # $('.menu', this).addClass('hidden').hide()
    trigger.click (event) ->
      unless open
        open = true
        $(menu).addClass "dr-menu-open"
        $(trigger).siblings(".pink-menu").removeClass('hidden')
        logo.removeClass('hidden')
        $('.menu').removeClass('hidden').show()
        $(".side").addClass "pink-box"

    icon.click (event) ->
      if open
        event.stopPropagation()
        open = false
        $(".side").removeClass "pink-box"
        $(menu).removeClass "dr-menu-open"
        $(trigger).siblings(".pink-menu").addClass('hidden')
        logo.addClass('hidden')
        $('.menu').removeClass('hidden').hide()
