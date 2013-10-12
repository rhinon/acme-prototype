Acme.PatientsController = Ember.ObjectController.extend
  patients: []

  actions:
    addPatient: ->
      @patients.pushObject name: @get('newPatientName')