class app.views.HightchartsRecentChart
  initialize: ->
    @options.plotOptions.area.fillColor.stop.push([0, Highcharts.getOptions().colors[0]])
    @options.plotOptions.area.fillColor.stop.push([1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')])

  options:
    chart: 
      zoomType: 'x'
    title:
      text: "Temperatura"
    xAxis:
      type: 'datetime'
      minRange: 24 * 3600000 # a day
    subtitle:
      text: 'Zaznacz żeby przybliżyć'
    yAxis:
      title:
        text: "Temperatura [C]"
    legend:
      enabled: false
    plotOptions:
      area:
        fillColor:
          linearGradient:
            x1: 0
            y1: 0
            x2: 0
            y2: 1
          stops: []
        marker:
          radius: 2
        lineWidth: 1
        states:
          hover:
            lineWidth: 1
        threshold: null

  constructor: ->
    @fetchData()

  fetchData: ->
    @collection = new app.models.Sensors()
    @collection.on("sync", @showChart)
    @collection.fetch()

  showChart: =>
    series = new app.utils.ChartJSChartDataConverter(@collection).convert()
    $('#container').highcharts(_.extend(@options, {series: series}) )
