'use strict'
Window.App.Views.TodoFilterView = Backbone.View.extend
  el: @$('[data-js-todo-filter]')

  events:
    'input [data-js-todo-filter-title]': 'setFilterByTitle'
    'change [data-js-todo-filter-done]': 'setFilterByDone'

  attributes:
    filters:
      title: ''
      done: 'all'

  setFilterByTitle: (e) ->
    @attributes.filters.title = $(e.target).val()
    @trigger('filter', @attributes.filters)

  setFilterByDone: (e) ->
    @attributes.filters.done = $(e.target).val()
    @trigger('filter', @attributes.filters)



