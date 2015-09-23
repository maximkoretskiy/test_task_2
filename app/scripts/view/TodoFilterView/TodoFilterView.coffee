'use strict'
window.App.Views.TodoFilterView = Backbone.View.extend
  template: _.template @$('#todoFilter').html()

  events:
    'input [data-js-todo-filter-title]': 'setFilterByTitle'
    'change [data-js-todo-filter-done]': 'setFilterByDone'

  filters:
    title: ''
    done: 'all'

  render: ->
    @$el.html @template()

  setFilterByTitle: (e) ->
    @filters.title = $(e.target).val()
    @trigger('filter', @filters)

  setFilterByDone: (e) ->
    @filters.done = $(e.target).val()
    @trigger('filter', @filters)



