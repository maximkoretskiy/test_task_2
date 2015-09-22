'use strict'
Window.App.Collections.TodoCollection = Backbone.Collection.extend
  model: Window.App.Models.TodoModel
  localStorage: new Backbone.LocalStorage("todolist-backbone")

  initialize: ->
    @listenTo(this, 'change', @save)
    @fetch()

  addTodoItem: (todoItem)->
    @create(todoItem)
