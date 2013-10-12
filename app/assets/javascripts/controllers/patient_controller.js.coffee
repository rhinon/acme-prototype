Acme.PatientController = Ember.ObjectController.extend(
  graphView: true
  toggleText: "Show Tables"

  actions:
    toggleView: ->
      @set "graphView", !@graphView
      @set "toggleText", if @graphView then "Show Tables" else "Show Graphs"
)