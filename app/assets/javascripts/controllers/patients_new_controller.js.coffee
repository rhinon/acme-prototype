Acme.PatientsNewController = Ember.ObjectController.extend(

  actions:
    save: ->
      # TODO check save return? validation, etc...
      model = @get('model')

      model.save().then =>
        @transitionToRoute('patients')

    cancel: ->
      @transitionToRoute('patients')
)