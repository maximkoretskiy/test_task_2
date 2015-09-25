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
    '*other': 'default'

  index: ->
    $($('.content-block')[0]).html('')
    $($('.content-block')[0]).append(appView.$el)

  items: (id)->
    if(+id - 1 < appView.collection.models.length && +id)
      $($('.content-block')[0]).html('')
      itemView = new window.App.Views.TodoItemView model: appView.collection.models[+id - 1]
      $($('.content-block')[0]).append(itemView.render().$el)
    else
      $($('.content-block')[0]).html('Страница не найдена')

    default: (other)->
      $($('.content-block')[0]).html('Страница не найдена')


router = new window.App.Routers.Router()
Backbone.history.start()


