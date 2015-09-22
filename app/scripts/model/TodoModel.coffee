'use strict'
Window.App.Models.TodoModel = Backbone.Model.extend
  defaults:
    title: 'Новая задача'
    done: false

  toggle: ->
    @save {done: !@get 'done'}

  clear: ->
    @destroy()
