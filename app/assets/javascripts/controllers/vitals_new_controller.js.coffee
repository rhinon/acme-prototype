Acme.VitalsNewController = Ember.ObjectController.extend(
  
  actions:
    save: ->
      newVital = @get 'model'
      patient = @get('patient')
      self = this
      # BUGBUG since didCreateRecord doesn't get called on fail,
      # every failure will result in this fn getting called +1 times.
      # Not sure if ember-model supports error handling right now.
      newVital.one('didCreateRecord', -> 
        patient.reload()
        self.transitionToRoute('patients'))
      newVital.save()
      patient.reload()

    cancel: ->
      @transitionToRoute('patient', @get('content').patient)
)