module.exports = 
  access_token: process.env.C_ACCESS_TOKEN
  management_token: process.env.C_MANAGE_TOKEN
  space_id: process.env.C_SPACE_ID
  content_types:
    featured_case_studies:
      id: '4Sb5UN4GG486eOOcC6KASE'
      filters: "fields.featured": true

    featured_blog_posts:
      id: '5EQ8hTcdVe0C0OayyGcQ0E'
      filters: "fields.featured": true

    quote_slideshow:
      id: "2tTMTlaVv6ocQcaC2IQQ8m"
      filters: "fields.title": "quote_slideshow"

    culture_slideshow:
      id: "2tTMTlaVv6ocQcaC2IQQ8m"
      filters: "fields.title": "culture_slideshow"
    # posts:                          # data will be made available through this key on the `contentful` object in your templates
    #   id: 'xxxx'                    # ID of your content type
    #   filters: {}                   # passes filters to the call to contentful's API, see contentful's docs for more info
    #   template: 'path/to/template'  # if present a single page view will be created for each entry in the content type
    #   path: (entry) ->              # override function for generating single page file path, passed in the entry object
