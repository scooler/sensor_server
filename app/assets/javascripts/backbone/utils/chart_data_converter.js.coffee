class app.utils.ChartDataConverter
  constructor: (@collection) ->

  data: ->
    data = {
      labels: @labels()
      datasets: @datasets()
    }
    
    data

  labels: ->
    _.uniq(@collection.pluck("measured_at"))

  datas: (r) ->
    # return @_datas if @_datas
    datas = {}
    @collection.each( (r) -> 
      datas[r.get("description")] = datas[r.get("description")] || []
      datas[r.get("description")].push(r.get("measurement"))
    )
    # @datas = datas
    datas

  datasets: () ->
    datas = @datas()
    datasets = []
    _.each(datas, (v, k) -> datasets.push({labels:k, data: v}))
    datasets
    

    