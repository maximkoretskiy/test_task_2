'use strict'
appView = new window.App.Views.AppView()
appView.render()


window.App.Routers.Router = Backbone.Router.extend
  currentRoute: null
  initialize: ->
    @on "route", @onChangeRoute, this

  onChangeRoute: (route)->
    @currentRoute = route

  routes:
    '': 'index'
    'items/:id': 'items'

  index: ->
    $($('.content-block')[0]).html('')
    $($('.content-block')[0]).append(appView.$el)

  items: (id)->
    $($('.content-block')[0]).html('')
    itemView = new window.App.Views.TodoItemView model: appView.collection.models[+id + 1]
    itemView.render()
    $($('.content-block')[0]).append(itemView.$el)

router = new window.App.Routers.Router()
Backbone.history.start()


