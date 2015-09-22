'use strict'
Window.App.Views.TodoItemView = Backbone.View.extend
  template: _.template @$('#todoItem').html()

  events:
    'click [data-js-todo-delete]': 'destroy'
    'change [data-js-todo-done]': 'toggleDone'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  render: ->
    @$el.html @template(@model.attributes)
    @done = @$el.find('[data-js-todo-done]')
    @done.prop('checked', @model.get 'done')
    this

  destroy: ->
    @model.destroy()

  remove: ->
    @$el.remove()

  toggleDone: (e)->
    @model.toggle()
