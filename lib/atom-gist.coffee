
Gist = require './gist'

module.exports =

  initialize: ->
    @gist = null

  activate: (state) ->
    atom.workspaceView.command "gist:gist-file", => @gistFile()

  gistFile: ->
    @gist = new Gist;

    @gist.files =
      'foo':
        'content': 'foo bar baz'

    @gist.create (response) =>
      console.log response.html_url
