'use strict'
window.App.Views.TodoListView = Backbone.View.extend
  filters:
    title: ''
    done: 'all'

  initialize: ->
    @listenTo(@collection, 'add', @addTodo)
    @listenTo(@collection, 'change', @onChange)

  render: ->
    @$el.html('')
    @collection.each (todoModel)=>
      @addTodo(todoModel)

  hasTitleFilter: ->
    return @filters.title.length

  hasDoneFilter: ->
    return (@filters.done != 'all')

  addTodo: (todoModel)->
    if(@isTodoMatchFilters(todoModel))
      todoItemView = new window.App.Views.TodoItemView({model: todoModel})
      @$el.append(todoItemView.render().$el)

  isTodoMatchFilters: (todoModel)->
    if(!@hasTitleFilter() && !@hasDoneFilter())
      return true
    else
      if(@hasTitleFilter())
        if(@hasDoneFilter())
          return (((todoModel.get 'title').toLowerCase().indexOf(@filters.title.toLowerCase()) >= 0) &&
            ('' + todoModel.get('done')) == @filters.done)
        else
          return ((todoModel.get 'title').toLowerCase().indexOf(@filters.title.toLowerCase()) >= 0)
      else
        if(@hasDoneFilter())
          return (('' + todoModel.get('done') == @filters.done))
    return false

  onChange: (e)->
    @render()




