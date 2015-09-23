'use strict'
window.App.Views.AppView = Backbone.View.extend
  el: @$('.content-block')[0]
  template: _.template @$('#app').html()

  innerViews:
    todoAddView:
      el: '[data-js-todo-add]'
      view: 'TodoAddView'
    todoFilterView:
      el: '[data-js-todo-filter]'
      view: 'TodoFilterView'
    todoListView:
      el: '[data-js-todo-list]'
      view: 'TodoListView'

  render: ->
    @$el.html @template()
    @initInnerViews()
    @renderInnerViews()
    @listenTo(@innerViews.todoFilterView, 'filter', @filter)

  initInnerViews: ->
    innerViews = {}
    _.each @innerViews, (innerView, key) =>
      innerViews[key] = new window.App.Views[innerView.view]({el: @$(@innerViews[key].el), collection: @collection})
    @innerViews = innerViews

  renderInnerViews: ->
    _.each @innerViews, (innerView) =>
      innerView.render()

  filter: (filters) ->
    @innerViews.todoListView.filters = filters
    @innerViews.todoListView.render()



