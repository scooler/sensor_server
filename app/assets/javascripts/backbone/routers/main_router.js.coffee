class app.routers.MainRouter extends Backbone.Router
  routes:
    "" : "index"

  index: ->
    console.log("In router")
    @view = new app.views.RecentChart()