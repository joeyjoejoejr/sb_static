ideaBtn = (target) ->
  $buttonGroup = $ ".ideas-nav .button-group, .ideas-nav-mobile .button-group .categories .f-dropdown"
  $buttonGroupMobile = $ ".ideas-nav-mobile .button-group .categories .f-dropdown"
  if $buttonGroup.length > 0
    $buttonGroup.find(".is-checked").removeClass "is-checked"
    category = $(target || '.posts-category').data('category')
    if category
      $buttonGroup.children('[data-category="' + category + '"]').addClass 'is-checked'
      $buttonGroupMobile.children().show()
      $('.category').html category + '<div class="triangle-down"></div>'
      $buttonGroupMobile.children('[data-category="' + category + '"]').hide()

    else
      $buttonGroup.children('[data-category="all"]').addClass 'is-checked'
      $buttonGroupMobile.children().show()
      $buttonGroupMobile.children('[data-category="all"]').hide()
      $('.category').html "Show All" + '<div class="triangle-down"></div>'

if (history && history.pushState)
  $(document).on "click", ".pagination a[data-remote=true], a[data-remote=true].pushstate", (e) ->
    history.pushState {}, document.title, $(this).attr("href")

  $(window).on "popstate", ->
    popped = ("state" of window.history and window.history.state isnt null)
    initialURL = location.href
    initialPop = not popped and location.href is initialURL
    popped = true
    return  if initialPop
    # $.getScript document.location.href
    ideaBtn()

# This causes infinite page refresh on mobile
# if (history && history.pushState)
#   $(document).on "click", ".pagination a[data-remote=true], a[data-remote=true].pushstate", (e) ->
#     history.pushState {}, document.title, $(this).attr("href")

#   $(window).on "popstate", ->
#     Turbolinks.visit(document.location.href)

$(document).on "ready page:load", ->
  $('pre').each (i, e) ->
    hljs.highlightBlock(e)

  ideaBtn()
  $(".blog-posts ul li").css("cursor", "pointer").click ->
    window.location = $("a", this).attr("href")
    false

  if($('body').hasClass('blog_posts_post'))
    if window.DISQUS # Simply reload disqus
      DISQUS.reset
        reload: true
    else
      window.disqus_shortname = "smashingbox"
      dsq = document.createElement("script")
      dsq.type = "text/javascript"
      dsq.async = true
      dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js"
      (document.getElementsByTagName("head")[0] or document.getElementsByTagName("body")[0]).appendChild dsq

$(document).on "click", ".button-group .button", ->
  ideaBtn(event.target)
  $(this).parent().removeClass("open").css "left", "-9999px"  if $(this).parent().hasClass("open")

$(document).on "click", ".nav a, .social-share", ->
  if $(".nav").is(":visible")
    $(".nav").fadeOut 0, ->
      $(".social-share").fadeIn()
  else
    $(".social-share").fadeOut 0, ->
      $(".nav").fadeIn()

$(document).on "keydown", (e) ->
  prev = $('a.prev').attr('href')
  next = $('a.next').attr('href')

  if prev && e.keyCode == 37
    window.location = prev
  if next && e.keyCode == 39
    window.location = next
