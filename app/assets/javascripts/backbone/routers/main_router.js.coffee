class app.routers.MainRouter extends Backbone.Router
  routes:
    "" : "index"

  index: ->
    @view = new app.views.RecentChart()