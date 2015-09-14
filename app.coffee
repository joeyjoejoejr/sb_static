contentful   = require 'roots-contentful'
config       = require './contentful'
marked       = require 'marked'

module.exports =
  ignores: [
    'readme.md', '**/layout.*', '**/_*', '.gitignore', 'contentful.coffee',
    'Makefile', 'ship*', '**/foundation/*',
  ]

  scss:
    sourceMap: true

  locals:
    marked: marked

  extensions: [contentful(config)]
