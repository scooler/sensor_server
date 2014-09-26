class app.utils.ChartJSChartDataConverter
  constructor: (@collection) ->

  data: ->
    data = {
      labels: @formatLabels()
      datasets: @datasets()
    }
    data

  labels: ->
    _.uniq(_.flatten(@collection.map((s) -> s.get("measurements").pluck("measured_at") )))

  formatLabels: ->
    _.map(@labels(), @formatDateTime)

  formatDateTime: (dateString) ->
    date = new Date(dateString)
    "#{date.toLocaleDateString()} #{date.getHours()}:#{date.getMinutes()}"

  datasets: ->
    @collection.map(@dataset)

  dataset: (sensor) ->
    color = sensor.get("color")
    {
      label: sensor.get("name")
      data: sensor.get("measurements").pluck("measurement")
      fillColor: "rgba(#{color},0.2)"
      strokeColor: "rgba(#{color},1)"
      pointColor: "rgba(#{color},1)"
      pointStrokeColor: "#fff"
      pointHighlightFill: "#fff"
      pointHighlightStroke: "rgba(#{color},1)"
    }

    