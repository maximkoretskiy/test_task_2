'use strict'
window.App.Routers.Router = Backbone.Router.extend
  routes:
    '': 'index'
    'items/:id': 'items'
    '*': 'default'

  index: ->
    console.log 'index'

  items: (id)->
    console.log 'items ' + id

  default: ->
    console.log 'Некорректный запрос'
