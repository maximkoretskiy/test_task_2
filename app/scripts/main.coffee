'use strict'
todoCollection = new window.App.Collections.TodoCollection()
appView = new window.App.Views.AppView({collection: todoCollection})
appView.render()


