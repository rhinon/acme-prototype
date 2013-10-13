# for more details see: http://emberjs.com/guides/views/

Acme.PatientView = Ember.View.extend
  templateName: 'patient'

  didInsertElement: ->
    @updateCharts()

  updateCharts: ->
    #console.log @get 'controller.model.vitals'

    bpSys = []
    bpDia = []
    bodyTemps = []
    rrs = []
    hrs = []
    dates = []
    vitals = @get('controller.model').get('vitals')
    #console.log vitals
    for vital in vitals.toArray()
      bpSys.push vital.get('bloodPressureSystolic')
      bpDia.push vital.get('bloodPressureDiastolic')
      bodyTemps.push vital.get('bodyTemp')
      hrs.push vital.get('heartRateBpm')
      rrs.push vital.get('respiratoryRateBpm')
      dates.push(moment(vital.get('createdAt')).zone("-05:00").format('D/M h:mm a'))

    console.log hrs
    console.log rrs
    console.log dates

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

    bpChart = new Chart($("#bpChart").get(0).getContext("2d")).Line(bpData, {
      datasetFill: false
    });

    bodyTempChart = new Chart($("#bodyTempChart").get(0).getContext("2d")).Line(bodyTempData, {
      datasetFill: false
    });

    rrChart = new Chart($("#rrChart").get(0).getContext("2d")).Line(rrData, {
      datasetFill: false
    });

    hrChart = new Chart($("#hrChart").get(0).getContext("2d")).Line(hrData, {
      datasetFill: false
    });
