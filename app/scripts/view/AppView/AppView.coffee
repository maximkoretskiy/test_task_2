'use strict'
window.App.Views.AppView = Backbone.View.extend
  className: 'app-block'

  template: _.template @$('#app').html()

  innerViews:
    todoListView:
      el: '[data-js-todo-list]'
      view: 'TodoListView'

  filters:
    title: ''
    done: 'all'

  events:
    'click [data-js-todo-add-submit]': 'addItem'
    'keypress [data-js-todo-add-title]': 'addItemOnEnter'
    'input [data-js-todo-filter-title]': 'setTitleFilter'
    'change [data-js-todo-filter-done]': 'setDoneFilter'

  initialize: ->
    @collection = new window.App.Collections.TodoCollection()
    @filteredCollection = new window.App.Collections.TodoFilteredCollection null, originalCollection: @collection

  render: ->
    @$el.html @template()
    @initInnerViews()
    @renderInnerViews()

  initInnerViews: ->
    innerViews = {}
    _.each @innerViews, (innerView, key) =>
      innerViews[key] = new window.App.Views[innerView.view]({el: @$(@innerViews[key].el), collection: @filteredCollection})
    @innerViews = innerViews

  renderInnerViews: ->
    _.each @innerViews, (innerView) =>
      innerView.render()

  addItem: ->
    @collection.addNewItem title: @$el.find('[data-js-todo-add-title]').val()

  addItemOnEnter: (e)->
    if (e.keyCode == 13)
      @addItem()

  setTitleFilter: (e) ->
    @filteredCollection.setTitleFilter $(e.target).val()

  setDoneFilter: (e) ->
    @filteredCollection.setDoneFilter $(e.target).val()


