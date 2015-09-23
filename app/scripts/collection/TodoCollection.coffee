'use strict'
window.App.Collections.TodoCollection = Backbone.Collection.extend
  model: window.App.Models.TodoModel
  localStorage: new Backbone.LocalStorage("todolist-backbone")

  initialize: ->
    @listenTo(this, 'change', @save)
    @fetch()

  addTodoItem: (todoItem)->
    @create(todoItem)
