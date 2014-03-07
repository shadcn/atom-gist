{View} = require 'atom'

module.exports =
class AtomGistView extends View
  @content: ->
    @div class: 'atom-gist overlay from-top', =>
      @div "The AtomGist package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "atom-gist:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AtomGistView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
