'use strict'
window.App = {
  Models: {}
  Collections: {}
  Views: {}
}
_.extend(Backbone.Model.prototype, Backbone.Validation.mixin)
