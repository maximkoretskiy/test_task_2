'use strict'
todoCollection = new Window.App.Collections.TodoCollection()
todoListView = new Window.App.Views.TodoListView({collection: todoCollection})
todoListView.render()
todoAddView = new Window.App.Views.TodoAddView({collection: todoCollection})
todoFilterView = new Window.App.Views.TodoFilterView({collection: todoCollection})
appView = new Window.App.Views.AppView({attributes: {todoListView: todoListView, todoFilterView: todoFilterView}})


