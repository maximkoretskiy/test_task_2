'use strict'
window.App = {
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
}
_.extend(Backbone.Model.prototype, Backbone.Validation.mixin)
