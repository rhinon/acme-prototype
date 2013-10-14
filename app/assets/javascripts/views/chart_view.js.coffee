Acme.ChartView = Ember.View.extend
  templateName: 'chart'
  tagName: 'canvas'
  attributeBindings: ['width','height','class']
  width: '800px'
  height: '300px'
  class: ''
  chart: null

  didInsertElement: (->
    @loadChart()
  )

  observe_load_and_rerender: ( ->
    @loadChart()
  ).observes('model.isLoaded')

  loadChart: ->
    data = @get 'chartData'

    if data['labels'].length == 0
      @set 'width', '0px'
      @set 'height', '0px'
      return
    else
      @set 'width', '800px'
      @set 'height', '300px'

    chart = new Chart(@get('element').getContext("2d")).Line(data, {
      datasetFill: false
    })
