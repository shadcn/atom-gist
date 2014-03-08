
Gist = require './gist'

module.exports =

  initialize: ->
    @gist = null

  activate: (state) ->
    atom.workspaceView.command "gist:gist-file", => @gistFile()

  gistFile: ->
    @gist = new Gist;

    workspace = atom.workspace
    activeItem = workspace.activePane.activeItem

    # Show message in statusBar.
    atom.workspaceView.statusBar?.appendLeft '<span class="gist-message">Creating gist...</span>'

    # Get content from active file.
    @gist.files[activeItem.getTitle()] =
     content: activeItem.getText()

    @gist.create (response) =>
        atom.workspaceView.statusBar?.find('.gist-message').html("Gist created at " + response.html_url)
