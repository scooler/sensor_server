class app.utils.ChartJSChartDataConverter
  constructor: (@collection) ->

  convert: ->
    # data = {
    #   # labels: @formatLabels()
    #   datasets: @datasets()
    # }
    # data
    @datasets()

  # labels: ->
  #   _.uniq(_.flatten(@collection.map((s) -> s.get("measurements").pluck("measured_at") )))

  # formatLabels: ->
  #   _.map(@labels(), @formatDateTime)

  # formatDateTime: (dateString) ->
  #   date = new Date(dateString)
  #   "#{date.toLocaleDateString()} #{date.getHours()}:#{date.getMinutes()}"

  datasets: ->
    @collection.map(@dataset)

  dataset: (sensor) =>
    # color = sensor.get("color")
    {
      # type: "line"
      type: "area"
      name: sensor.get("name")
      pointInterval: 11 * 60 * 1000 + 4 * 1000 + 165 # 11 minutes, 4 and 1/6 seconds - that's the ussual sensor period for now 
      #TODO - check if/how to do time -> value and not blind periods between measurements
      pointStart: @firstMeasurementDate(sensor)

      data: sensor.get("measurements").pluck("measurement")
      # fillColor: "rgba(#{color},0.2)"
      # strokeColor: "rgba(#{color},1)"
      # pointColor: "rgba(#{color},1)"
      # pointStrokeColor: "#fff"
      # pointHighlightFill: "#fff"
      # pointHighlightStroke: "rgba(#{color},1)"
    }

  firstMeasurementDate: (sensor) ->
    new Date(sensor.get("measurements").at(0).get("measured_at")).getTime()

    
        #     series: [{
        #     type: 'area',
        #     name: 'USD to EUR',
        #     pointInterval: 24 * 3600 * 1000,
        #     pointStart: Date.UTC(2006, 0, 1),
        #     data: [
        #         0.8446, 0.8445, 0.8444, 0.8451,    0.8418, 0.8264,    0.8258, 0.8232,    0.8233, 0.8258,
        #         0.8283, 0.8278, 0.8256, 0.8292,    0.8239, 0.8239,    0.8245, 0.8265,    0.8261, 0.8269,
        #             (...)
        #     ]
        # }]