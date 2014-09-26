class app.utils.ChartJSChartDataConverter
  constructor: (@collection) ->

  convert: ->
    @datasets()

  datasets: ->
    @collection.map(@dataset)

  dataset: (sensor) =>
    {
      type: "area"
      name: sensor.get("name")
      pointInterval: 11 * 60 * 1000 + 4 * 1000 + 195 # 11 minutes, 4 and 1/6 seconds - that's the ussual sensor period for now 
      #TODO - check if/how to do time -> value and not blind periods between measurements
      pointStart: @firstMeasurementDate(sensor)

      data: sensor.get("measurements").pluck("measurement")
    }

  firstMeasurementDate: (sensor) ->
    new Date(sensor.get("measurements").at(0).get("measured_at")).getTime()