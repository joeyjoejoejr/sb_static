$(document).on "ready page:load", ->
  options = oneOpenedItem: true
  if $(".listing-accordion li.job-listing").length == 1
    options["open"] = 0
  $(".listing-accordion").accordion options
