# for more details see: http://emberjs.com/guides/views/

Acme.PatientView = Ember.View.extend
  templateName: 'patient'
  chartsLoaded: false
  bpChart: null

  didInsertElement: ->
    console.log 'didInsertElement'
    #@get('controller').on('switchedToGraphView', $.proxy(@updateCharts, this));
    @updateCharts()

  refreshChart: ->
    

  # vitalsObserver: ( ->
  #   console.log 'vitals observed'

  #   vitals = @get('controller.model.vitals')
  #   console.log vitals

  #   #return if !this.$() # View not in DOM


  #   if !this.$()
  #     vitals.addObserver('updateCharts')
  #     return

  #   Ember.run.scheduleOnce('afterRender', this, 'updateCharts');
  # ).observes('controller.model.vitals.isLoaded')

  vitalsObserver: ( ->
    console.log 'vitals observed'

    return if !this.$() # View not in DOM
    @updateCharts()
  ).observes('controller.model.vitals')

  updateCharts: ->
    console.log 'Charts updating!'
    # if @chartsLoaded
    #   console.log 'ignoring duplicate'
    #   return

    # @set 'chartsLoaded', true
    #console.log @get 'controller.model.vitals'

    bpSys = []
    bpDia = []
    bodyTemps = []
    rrs = []
    hrs = []
    dates = []
    vitals = @get('controller.model.vitals')
    console.log vitals

    if vitals.toArray().length == 0
      console.log vitals.toArray()
      console.log 'vitals not loaded'
      return

    #console.log vitals
    for vital in vitals.toArray()
      bpSys.push vital.get('blood_pressure_systolic')
      bpDia.push vital.get('blood_pressure_diastolic')
      bodyTemps.push vital.get('body_temp')
      hrs.push vital.get('heart_rate_bpm')
      rrs.push vital.get('respiratory_rate_bpm')
      dates.push(moment(vital.get('created_at')).zone("-05:00").format('M/D h:mm a'))

    console.log bpSys
    console.log bpDia

    bpData =
      labels: dates
      datasets: [
        {
          fillColor : "rgba(87,205,193,0.5)",
          strokeColor : "rgba(87,205,193,1)",
          pointColor : "rgba(87,205,193,1)",
          pointStrokeColor : "#fff",
          data : bpSys
        },
        {
          fillColor : "rgba(151,187,205,0.5)",
          strokeColor : "rgba(151,187,205,1)",
          pointColor : "rgba(151,187,205,1)",
          pointStrokeColor : "#fff",
          data : bpDia
        }
      ]
    bodyTempData =
      labels: dates
      datasets: [{
        fillColor : "rgba(87,205,105,0.5)",
        strokeColor : "rgba(87,205,105,1)",
        pointColor : "rgba(87,205,105,1)",
        pointStrokeColor : "#fff",
        data : bodyTemps
        }]
    rrData =
      labels: dates
      datasets: [{
        fillColor : "rgba(166,87,205,0.5)",
        strokeColor : "rgba(166,87,205,1)",
        pointColor : "rgba(166,87,205,1)",
        pointStrokeColor : "#fff",
        data : rrs
        }]
    hrData =
      labels: dates
      datasets: [{
        fillColor : "rgba(205,87,87,0.5)",
        strokeColor : "rgba(205,87,87,1)",
        pointColor : "rgba(205,87,87,1)",
        pointStrokeColor : "#fff",
        data : hrs
        }]

    return if !this.$() # View not in DOM

    console.log 'charts created'

    test = $("#bpChart").get(0)



    # bpChart = new Chart(test.getContext("2d")).Line(bpData, {
    #   datasetFill: false
    # })

    # bodyTempChart = new Chart($("#bodyTempChart").get(0).getContext("2d")).Line(bodyTempData, {
    #   datasetFill: false
    # })

    # rrChart = new Chart($("#rrChart").get(0).getContext("2d")).Line(rrData, {
    #   datasetFill: false
    # })

    # hrChart = new Chart($("#hrChart").get(0).getContext("2d")).Line(hrData, {
    #   datasetFill: false
    # })
