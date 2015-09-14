# //= require cardboard/redactor
# //= require cardboard/redactor/highlight
# //= require cardboard/redactor/video

window.init_redactor = (item) ->
  csrf_token = $("meta[name=csrf-token]").attr("content")
  csrf_param = $("meta[name=csrf-param]").attr("content")
  params = undefined
  params = csrf_param + "=" + encodeURIComponent(csrf_token)  if csrf_param isnt `undefined` and csrf_token isnt `undefined`
  item.redactor
    plugins: ["fullscreen", "video"]
    imageUpload: "/cardboard/redactor/image?" + params
    fileUpload: '/cardboard/redactor/file?' + params
    toolbarFixedBox: true
    # Uncomment as need be (these routes are created for you)
    # imageGetJson: '/cardboard/redactor/images'


$(document).on "ready page:load", ->
  window.init_redactor($(".redactor, .wysihtml5"))

$(document).on "cocoon:after-insert", (e, item) ->
  window.init_redactor($(item[0]).find(".redactor, .wysihtml5"))
