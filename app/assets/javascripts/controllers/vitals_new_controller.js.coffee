Acme.VitalsNewController = Ember.ObjectController.extend(

  actions:
    save: ->
      console.info 'hi'
      console.info(@get('vitals'))

      #patient = App.Patient.find(@get('patient_id'));
      #patient.get("vitals").pushObject(App.Item.find(1));
      @get('store').commit()

    cancel: ->
      @get('content').deleteRecord()
      @get('store').transaction().rollback()
      @transitionToRoute('patients')
  
  transitionAfterSave: ( ->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    @transitionToRoute('patient', @get('content').patient) if @get('content.id')
  ).observes('content.id')
  
)