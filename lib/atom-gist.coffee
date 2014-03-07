AtomGistView = require './atom-gist-view'

module.exports =
  atomGistView: null

  activate: (state) ->
    @atomGistView = new AtomGistView(state.atomGistViewState)

  deactivate: ->
    @atomGistView.destroy()

  serialize: ->
    atomGistViewState: @atomGistView.serialize()
