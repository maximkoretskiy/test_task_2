define ['backbone', 'todoModel', 'backbone.localStorage'], (Backbone, TodoModel, localStorage) ->
  TodoCollection = Backbone.Collection.extend
    model: TodoModel

    localStorage: new Backbone.LocalStorage "todolist-backbone"

    initialize: ->
      @fetch()

    addNewItem: (options)->
      @create(options)
      this

