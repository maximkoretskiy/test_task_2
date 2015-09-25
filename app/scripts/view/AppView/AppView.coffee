define ['backbone', 'todoCollection', 'todoFilteredCollection', 'todoListView'],
(Backbone, TodoCollection, TodoFilteredCollection, TodoListView)->
  AppView = Backbone.View.extend
    className: 'app-block'

    template: _.template @$('#app').html()

    filters:
      title: ''
      done: 'all'

    events:
      'click [data-js-todo-add-submit]': 'addItem'
      'keypress [data-js-todo-add-title]': 'addItemOnEnter'
      'input [data-js-todo-filter-title]': 'setTitleFilter'
      'change [data-js-todo-filter-done]': 'setDoneFilter'

    initialize: ->
      @collection = new TodoCollection()
      @filteredCollection = new TodoFilteredCollection null, originalCollection: @collection

    render: ->
      @$el.html @template()
      @todoListView = new TodoListView {collection: @filteredCollection}
      @$el.find('[data-js-todo-list]').append @todoListView.render().$el
      this

    addItem: ->
      @collection.addNewItem title: @$el.find('[data-js-todo-add-title]').val()

    addItemOnEnter: (e)->
      if (e.keyCode == 13)
        @addItem()

    setTitleFilter: (e) ->
      @filteredCollection.setTitleFilter $(e.target).val()

    setDoneFilter: (e) ->
      @filteredCollection.setDoneFilter $(e.target).val()


