'use strict'
window.App.Views.TodoListView = Backbone.View.extend

  initialize: ->
    @listenTo(@collection, 'add', @renderTodo)
    @listenTo(@collection, 'update', @render)
    # @listenTo(@collection, 'change', @render)

  render: ->
    @$el.html ''
    @collection.each (todoModel)=>
      @renderTodo(todoModel)

  renderTodo: (todoModel)->
    todoItemView = new window.App.Views.TodoItemView({model: todoModel})
    @$el.append(todoItemView.render().$el)






