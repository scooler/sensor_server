# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class RecentChart
  initialize: ->
    ctx = $("#myChart").get(0).getContext("2d")
    @myNewChart = new Chart(ctx)

  fetchData: ->

  createDataHash: ->
    


$ -> new RecentChart()