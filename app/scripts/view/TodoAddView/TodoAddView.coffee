'use strict'
window.App.Views.TodoAddView = Backbone.View.extend
  template: _.template @$('#todoAdd').html()

  events:
    'click [data-js-todo-add-submit]': 'add'
    'keypress [data-js-todo-add-title]': 'addOnEnter'

  render: ->
    @$el.html @template()

  add: ->
    title = @$el.find('[data-js-todo-add-title]').val()
    task = new window.App.Models.TodoModel({title: title})
    @collection.addTodoItem(task)

  addOnEnter: (e)->
    if (e.keyCode == 13)
      @add()


