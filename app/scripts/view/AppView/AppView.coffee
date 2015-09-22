'use strict'
Window.App.Views.AppView = Backbone.View.extend
  initialize: ->
    @listenTo(@attributes.todoFilterView, 'filter', @filter)

  filter: (filters) ->
    @attributes.todoListView.attributes.filters = filters
    @attributes.todoListView.render()



