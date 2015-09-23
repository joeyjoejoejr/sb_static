S = require "string"

module.exports =
  access_token: process.env.C_ACCESS_TOKEN
  management_token: process.env.C_MANAGE_TOKEN
  space_id: process.env.C_SPACE_ID
  content_types:
    case_studies:
      id: '4Sb5UN4GG486eOOcC6KASE'

    featured_case_studies:
      id: '4Sb5UN4GG486eOOcC6KASE'
      filters: "fields.featured": true

    featured_blog_posts:
      id: '5EQ8hTcdVe0C0OayyGcQ0E'
      filters:
        "fields.featured": true
        "order": "-fields.published"
      path: (post) -> "ideas/#{S(post.title).slugify().s}"

    blog_posts:
      id: '5EQ8hTcdVe0C0OayyGcQ0E'
      filters: "order": "-fields.published"
      template: "views/ideas/_post.jade"
      path: (post) -> "ideas/#{S(post.title).slugify().s}"

    quote_slideshow:
      id: "2tTMTlaVv6ocQcaC2IQQ8m"
      filters: "fields.title": "quote_slideshow"

    culture_slideshow:
      id: "2tTMTlaVv6ocQcaC2IQQ8m"
      filters: "fields.title": "culture_slideshow"

    employees:
      id: "4GSSXcFKE8gwswoWOOGCME"
      filters: "order": "fields.seniority"
      template: 'views/_bio.jade'
      path: (employee) -> "bio/#{S(employee.name).slugify().s}"

    categories:
      id: "4cEvdDPmooOGUOSAwwQIwA"
      template: "views/ideas/category/_category.jade"
      path: (category) -> "ideas/category/#{S(category.name).slugify().s}"

    tags:
      id: "29QhMIKLywimmqcoYmQ88u"
      template: "views/ideas/tag/_tag.jade"
      path: (tag) -> "ideas/tag/#{S(tag.name).slugify().s}"

    jobs:
      id: "1d0RLbTvU06yA2mG4CGu4W"
      filter:
        "order": "fields.importance"

    # posts:                          # data will be made available through this key on the `contentful` object in your templates
    #   id: 'xxxx'                    # ID of your content type
    #   filters: {}                   # passes filters to the call to contentful's API, see contentful's docs for more info
    #   path: (entry) ->              # override function for generating single page file path, passed in the entry object
