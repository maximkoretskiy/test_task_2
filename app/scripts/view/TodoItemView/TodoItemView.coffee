define ['backbone'], (Backbone)->
  TodoItemView = Backbone.View.extend
    template: _.template @$('#todoItem').html()

    className: 'todo-item'

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
      @editTitle.addClass 'hidden'
      @title.removeClass 'hidden'
      this

    showEditTitle: ->
      @editTitle.removeClass 'hidden'
      @title.addClass 'hidden'

    saveEditedTitleOnEnter: (e)->
      if (e.keyCode == 13)
        @model.changeTitle @editTitle.val()

    toggleDone: (e)->
      @model.toggle()

    destroy: ->
      @model.destroy()

    remove: ->
      @$el.remove()
