Acme.ChartView = Ember.View.extend
  templateName: 'chart'
  tagName: 'canvas'
  attributeBindings: ['width','height']
  width: '800px'
  height: '300px'
  chart: null

  didInsertElement: (->
    @loadChart()
  )

  observe_load_and_rerender: ( ->
    @rerender()
  ).observes('model.isLoaded')

  loadChart: ->
    # dates = @get 'dates'
    data = @get 'chartData'
    # #data2 = @get 'chartData2'
    # color = @get 'color'

    console.log data

    if data['labels'].length == 0
      return

    # datasets = []
    # index = 0
    # for data in chartData
    #   datasets.push {
    #       fillColor : "rgba(" + color[index] + ",0.5)"
    #       strokeColor : "rgba(" + color[index] + ",1)"
    #       pointColor : "rgba(" + color[index] + ",1)"
    #       pointStrokeColor : "#fff"
    #       data : data
    #     }
    #   index += 1

    # chartData =
    #   labels: dates
    #   datasets: datasets

    # if !chart
    chart = new Chart(@get('element').getContext("2d")).Line(data, {
      datasetFill: false
    })
    # else
    #   chart.