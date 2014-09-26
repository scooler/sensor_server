class app.models.Sensor extends Backbone.Model
  initialize: ->
    @attributes.measurements = new app.models.RecentReadouts(@get("measurements") )
