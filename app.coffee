require('dotenv').load()

contentful   = require 'roots-contentful'
config       = require './contentful'
marked       = require 'marked'
browserify   = require 'roots-browserify'
lodash       = require 'lodash'

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

  extensions: [
    contentful(config)
    browserify(files: 'assets/js/application.coffee', out: 'js/build.js')
  ]

  server:
    clean_urls: true
