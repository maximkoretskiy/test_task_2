'use strict'
Window.App.Models.TodoModel = Backbone.Model.extend
  defaults:
    title: 'Новая задача'
    done: false

  toggle: ->
    @save {done: !@get 'done'}

  setTitle: (newTitle)->
    @save {title: newTitle}

  clear: ->
    @destroy()
