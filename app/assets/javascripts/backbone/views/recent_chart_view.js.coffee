class app.views.RecentChart
  constructor: ->
    ctx = $("#myChart").get(0).getContext("2d")
    @myNewChart = new Chart(ctx)
    @fetchData()

  fetchData: ->
    @collection = new app.models.Sensors()
    @collection.on("sync", @showChart)
    @collection.fetch()

  showChart: =>
    @lineChart = @myNewChart.Line(new app.utils.ChartDataConverter(@collection).data(), {})
