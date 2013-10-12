Acme.PatientsNewController = Ember.ObjectController.extend(

  actions:
    save: ->
      #console.info(@get('content'))
      #Raffler.Patients.createRecord()
      @get('store').commit()

    cancel: ->
      @get('content').deleteRecord()
      @get('store').transaction().rollback()
      @transitionToRoute('patients')
  
  transitionAfterSave: ( ->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    @transitionToRoute('patient', @get('content')) if @get('content.id')
  ).observes('content.id')
  
)