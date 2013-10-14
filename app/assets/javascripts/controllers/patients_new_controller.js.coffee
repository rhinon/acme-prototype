Acme.PatientsNewController = Ember.ObjectController.extend(

  actions:
    save: ->
      # TODO check save return? validation, etc...
      model = @get('model')
      self = this

      # BUGBUG since didCreateRecord doesn't get called on fail,
      # every failure will result in this fn getting called +1 times.
      # Not sure if ember-model supports error handling right now.
      model.one('didCreateRecord', -> 
        console.debug 'didCreateRecord'
        self.transitionToRoute('patients'))

      @get('model').save()
      

    cancel: ->
      @transitionToRoute('patients')
)