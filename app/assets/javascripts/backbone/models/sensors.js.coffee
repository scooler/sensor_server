#= require ./sensor
class app.models.Sensors extends Backbone.Collection
  model: app.models.Sensor

  url: -> "/sensors/last_measurements"
