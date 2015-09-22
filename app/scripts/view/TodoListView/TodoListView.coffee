'use strict'
Window.App.Views.TodoListView = Backbone.View.extend
  el: @$('[data-js-todo-list]')

  attributes:
    filters:
      title: ''
      done: 'all'

  initialize: ->
    @listenTo(@collection, 'add', @addTodo)

  render: ->
    @$el.html('')
    @collection.each (todoModel)=>
      @addTodo(todoModel)

  hasTitleFilter: ->
    return @attributes.filters.title.length

  hasDoneFilter: ->
    return (@attributes.filters.done != 'all')

  addTodo: (todoModel)->
    if(@isTodoMatchFilters(todoModel))
      todoItemView = new Window.App.Views.TodoItemView({model: todoModel})
      @$el.append(todoItemView.render().$el)

  isTodoMatchFilters: (todoModel)->
    if(!@hasTitleFilter() && !@hasDoneFilter())
      return true
    else
      if(@hasTitleFilter())
        if(@hasDoneFilter())
          return (((todoModel.get 'title').toLowerCase().indexOf(@attributes.filters.title.toLowerCase()) >= 0) &&
            ('' + todoModel.get('done')) == @attributes.filters.done)
        else
          return ((todoModel.get 'title').toLowerCase().indexOf(@attributes.filters.title.toLowerCase()) >= 0)
      else
        if(@hasDoneFilter())
          return (('' + todoModel.get('done') == @attributes.filters.done))
    return false





