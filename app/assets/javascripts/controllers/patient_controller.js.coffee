Acme.PatientController = Ember.ObjectController.extend(

  actions:
    toggleView: ->
      @set "graphView", true
)