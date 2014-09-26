#= require_self
#= require_directory ./models
#= require_directory ./utils
#= require_directory ./templates
#= require_directory ./views
#= require_directory ./routers

@app = @app || {}
app.models = app.models || {}
app.utils = app.utils || {}
app.views = app.views || {}
app.routers = app.routers || {}


app.init = ->
  console.log("app init")
  new app.routers.MainRouter()
  Backbone.history.start()

$(app.init)