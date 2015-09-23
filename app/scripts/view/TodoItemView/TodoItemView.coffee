'use strict'
window.App.Views.TodoItemView = Backbone.View.extend
  template: _.template @$('#todoItem').html()

  events:
    'click [data-js-todo-delete]': 'destroy'
    'change [data-js-todo-done]': 'toggleDone'
    'click [data-js-todo-title]': 'showEditTitle'
    'keypress [data-js-todo-edit-title]': 'saveEditedTitleOnEnter'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  render: ->
    @$el.html @template(@model.attributes)
    @$el.addClass 'todo-item'
        .attr('data-js-todo-id', @model.get 'id')
    @done = @$el.find('[data-js-todo-done]')
    @done.prop('checked', @model.get 'done')
    @title = @$el.find('[data-js-todo-title]')
    @editTitle = @$el.find('[data-js-todo-edit-title]').val(@model.get 'title')
    this

  showEditTitle: ->
    @editTitle.removeClass 'hidden'
    @title.addClass 'hidden'

  saveEditedTitleOnEnter: (e)->
    if (e.keyCode == 13)
      @model.setTitle @editTitle.val()
      @editTitle.addClass 'hidden'
      @title.removeClass 'hidden'

  destroy: ->
    @model.destroy()

  remove: ->
    @$el.remove()

  toggleDone: (e)->
    @model.toggle()