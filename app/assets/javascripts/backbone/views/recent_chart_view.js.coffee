# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class app.views.RecentChart
  constructor: ->
    console.log("init view")
    ctx = $("#myChart").get(0).getContext("2d")
    @myNewChart = new Chart(ctx)
    @fetchData()

  fetchData: ->
    console.log("fetch data")
    @collection = new app.models.Sensors()
    @collection.on("sync", @showChart)
    @collection.fetch()

  showChart: =>
    # @myNewChart.Line(@createDataHash())
    console.log("show chart")
    @lineChart = @myNewChart.Line(new app.utils.ChartDataConverter(@collection).data(), {})
    # @collection.each((r) => @lineChart.addData([r.get("measurement")], r.get("measured_at")) )

  createDataHash: ->
    # new app.utils.ChartDataConverter(@collection)
