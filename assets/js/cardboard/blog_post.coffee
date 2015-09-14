$(document).on "ready page:load", ->
  options = {
    uploadUrl: '/cardboard/file',
    uploadFieldName: 'file',
    downloadFieldName: 'file',
    allowedTypes: [
        'image/jpeg',
        'image/png',
        'image/jpg',
        'image/gif'
    ],
    progressText: '![Uploading file...]()',
    urlText: "![file]({filename})",
    errorText: "Error uploading file",
    uploadMethod: 'POST',
    extraHeaders: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    #   'Content-Type': 'multipart/form-data'
    }
  }
  $('textarea').inlineattach(options)
