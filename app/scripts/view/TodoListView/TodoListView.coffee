define ['backbone', 'todoItemView'], (Backbone, TodoItemView)->
  TodoListView = Backbone.View.extend

    initialize: ->
      # @listenTo(@collection, 'add', @renderTodo)
      @listenTo(@collection, 'update', @render)
      # @listenTo(@collection, 'change', @render)

    render: ->
      debugger
      @$el.html ''
      @collection.each (todoModel)=>
        @renderTodo(todoModel)

    renderTodo: (todoModel)->
      todoItemView = new TodoItemView({model: todoModel})
      @$el.append(todoItemView.render().$el)






