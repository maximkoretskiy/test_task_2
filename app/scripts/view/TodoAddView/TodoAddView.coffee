'use strict'
Window.App.Views.TodoAddView = Backbone.View.extend
  el: @$('[data-js-todo-add]')

  events:
    'click [data-js-todo-add-submit]': 'add'
    'keypress [data-js-todo-add-title]': 'addOnEnter'

  initialize: ->
    @submitButton = @$el.find('[data-js-todo-add-submit]')
    @todoTitle = @$el.find('[data-js-todo-add-title]')

  add: ->
    title = @todoTitle.val()
    task = new Window.App.Models.TodoModel({title: title})
    @collection.addTodoItem(task)

  addOnEnter: (e)->
    if (e.keyCode == 13)
      @add()


