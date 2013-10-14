Acme.PatientController = Ember.ObjectController.extend(Ember.Evented, 
  graphView: true
  toggleText: "Show Tables"

  all_body_temps: []
  all_heart_rates: []
  all_resp_rates: []
  all_bp: []

  # Observes when the patient loads and populates the graph data
  populateGraphVitalsData: ( ->
    console.log 'observed patient!'
    console.log vitals = @get('model.vitals').toArray()

    vitals = @get('model.vitals').toArray()
    if vitals is undefined
      return []
    
    all_body_temps = @get 'all_body_temps'
    all_heart_rates = @get 'all_heart_rates'
    all_resp_rates = @get 'all_resp_rates'
    all_bp = @get 'all_bp'

    vital_dates = []
    all_body_temps = []
    all_heart_rates = []
    all_resp_rates = []
    all_bp_sys = []
    all_bp_dia = []
    all_bp = []

    for vital in vitals
      vital_dates.push(moment(vital.get('created_at')).zone("-05:00").format('M/D h:mm a'))
      all_body_temps.push(vital.get('body_temp'))
      all_heart_rates.push vital.get('heart_rate_bpm')
      all_resp_rates.push vital.get('respiratory_rate_bpm')
      all_bp_sys.push vital.get('blood_pressure_systolic')
      all_bp_dia.push vital.get('blood_pressure_diastolic')
    
    # Vitals are sorted descending, for the graph we need to flip
    # Push+Reverse appears to be more performant than unshift:
    # http://jsperf.com/array-push-vs-unshift
    vital_dates = vital_dates.reverse()

    @set 'all_body_temps', { 
      labels: vital_dates
      datasets: [@_generateDataSet(all_body_temps,"87,205,105")]}
    @set 'all_heart_rates', { 
      labels: vital_dates
      datasets: [@_generateDataSet(all_heart_rates,"205,87,87")]}
    @set 'all_resp_rates', { 
      labels: vital_dates
      datasets: [@_generateDataSet(all_resp_rates,"166,87,205")]}
    @set 'all_bp', {
      labels: vital_dates
      datasets: [@_generateDataSet(all_bp_sys,"87,205,193"), @_generateDataSet(all_bp_dia,"151,187,205")]}

  ).observes('model.isLoaded')

  _generateDataSet: (data,color) ->
    data = data.reverse()
    return {
      fillColor : "rgba(" + color + ",0.5)"
      strokeColor : "rgba(" + color + ",1)"
      pointColor : "rgba(" + color + ",1)"
      pointStrokeColor : "#fff"
      data : data
    }

  actions:
    toggleView: ->
      @set "graphView", !@graphView
      @set "toggleText", if @graphView then "Show Tables" else "Show Graphs"
      @trigger 'switchedToGraphView' if @graphView
)