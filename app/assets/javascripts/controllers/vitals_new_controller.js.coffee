Acme.VitalsNewController = Ember.ObjectController.extend(
  patient_id: 0

  actions:
    save: ->
      newVital = @get 'model'
      # patient = Acme.Patient.find(1)
      # newVital.set 'patient', patient
      # patient.get('vitals').push newVital
      # patient.save()
      #newVital.save()

      patient = @get('patient')
      vitals = patient.get('vitals')

      #newVital.set('patient_id', 4)
      console.log patient
      console.log vitals

      newVital.save()
      patient.reload()
      #newVital.get('patient').get('vitals.lastObject').save()
      # TODO check save return? sync/async? validation, etc...
      @transitionToRoute('patient', @get('content').patient)

    cancel: ->
      @transitionToRoute('patient', @get('content').patient)
  
  transitionAfterSave: ( ->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    @transitionToRoute('patient', @get('content').patient) if @get('content.id')
  ).observes('content.id')
  
)