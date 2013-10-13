Acme.PatientController = Ember.ObjectController.extend(Ember.Evented, 
  graphView: true
  toggleText: "Show Tables"

  actions:
    toggleView: ->
      @set "graphView", !@graphView
      @set "toggleText", if @graphView then "Show Tables" else "Show Graphs"
      @trigger 'switchedToGraphView' if @graphView
)