Acme.VitalsNewController = Ember.ObjectController.extend(
  
  actions:
    save: ->
      newVital = @get 'model'
      patient = @get('patient')
      test = newVital.save()
      console.log test
      patient.reload()
      @transitionToRoute('patient', @get('content').patient)

    cancel: ->
      @transitionToRoute('patient', @get('content').patient)
  
  transitionAfterSave: ( ->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    @transitionToRoute('patient', @get('content').patient) if @get('content.id')
  ).observes('content.id')
  
)