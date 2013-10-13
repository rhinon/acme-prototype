Acme.PatientsNewController = Ember.ObjectController.extend(

  actions:
    save: ->
      @get('model').save()
      # TODO check save return? sync/async? validation, etc...
      @transitionToRoute('patients')

    cancel: ->
      @transitionToRoute('patients')
  
  transitionAfterSave: ( ->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    @transitionToRoute('patient', @get('content')) if @get('content.id')
  ).observes('content.id')
  
)