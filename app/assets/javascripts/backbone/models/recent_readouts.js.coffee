#= require ./readout
class app.models.RecentReadouts extends Backbone.Collection
  model: app.models.Readout

  url: -> "/last_measurements"
