require('dotenv').load()

contentful   = require 'roots-contentful'
config       = require './contentful'
marked       = require 'marked'
browserify   = require 'roots-browserify'
lodash       = require 'lodash'
css_pipeline = require 'css-pipeline'

module.exports =
  ignores: [
    'readme.md', '**/layout.*', '**/_*', '.gitignore', 'contentful.coffee',
    'Makefile', 'ship*',
  ]

  scss:
    sourceMap: true

  locals:
    marked: marked
    trunc: lodash.trunc
    sample: lodash.sample

  extensions: [
    css_pipeline(files: "assets/css/application.scss", out: "css/build.css")
    contentful(config)
    browserify(files: 'assets/js/application.coffee', out: 'js/build.js')
  ]

  server:
    clean_urls: true
