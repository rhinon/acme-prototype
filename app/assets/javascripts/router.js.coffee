# For more information see: http://emberjs.com/guides/routing/

Acme.IndexRoute = Ember.Route.extend(redirect: ->
  @transitionTo "patients"
)

Acme.Router.map ->
  @resource 'about'
  @resource 'patients', ->
    @route 'new'
    @resource "patient", path: ":patient_id", ->
      @resource 'vitals', ->
        @route 'new'

Acme.PatientsIndexRoute = Ember.Route.extend
  model: -> Acme.Patient.find()

  setupController: (controller, model) ->
    model.reload()
    controller.set 'filteredModels', model
    controller.set 'content', model

Acme.PatientsNewRoute = Ember.Route.extend
  model: -> Acme.Patient.create()

Acme.PatientRoute = Ember.Route.extend
  model: (params,model) -> 
    patient = Acme.Patient.find(params.patient_id)
    patient.get('vitals').reload()
    patient

Acme.VitalsNewRoute = Ember.Route.extend
  model: (params,model) -> 
    Acme.Vital.create({patient: @modelFor('patient')})

  setupController: (controller, model) ->
    controller.set 'content', model