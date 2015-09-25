require.config
  paths:
    'jquery': '/bower_components/jquery/dist/jquery'
    'underscore': '/bower_components/underscore/underscore'
    'modernizr': '/bower_components/modernizr/modernizr'
    'backbone': '/bower_components/backbone/backbone'
    'backbone.localStorage': '/bower_components/backbone.localStorage/backbone.localStorage'
    'backbone.validation': '/bower_components/backbone.validation/dist/backbone-validation'
    # locals
    'todoModel': 'model/TodoModel'
    'todoCollection': 'collection/TodoCollection'
    'todoFilteredCollection': 'collection/TodoFilteredCollection'
    'todoItemView': 'view/TodoItemView/TodoItemView'
    'todoListView': 'view/TodoListView/TodoListView'
    'appView': 'view/AppView/AppView'

require ['backbone', 'appView', 'todoItemView'], (Backbone, AppView, TodoItemView)->
  # _.extend(Backbone.Model.prototype, Backbone.Validation.mixin)
  appView = new AppView()

  appView.render()

  Router = Backbone.Router.extend
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
        itemView = new TodoItemView model: appView.collection.models[+id - 1]
        $($('.content-block')[0]).append(itemView.render().$el)
      else
        $($('.content-block')[0]).html('Страница не найдена')

      default: (other)->
        $($('.content-block')[0]).html('Страница не найдена')


  router = new Router()
  Backbone.history.start()


