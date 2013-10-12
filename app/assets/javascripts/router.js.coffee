# For more information see: http://emberjs.com/guides/routing/

Acme.IndexRoute = Ember.Route.extend(redirect: ->
  @transitionTo "patients"
)

Acme.Router.map ->
  @resource 'about'
  #@route 'patients', path: '/'
  @resource 'patients', ->
    @route 'new'
    @resource "patient", path: ":patient_id"

Acme.PatientsIndexRoute = Ember.Route.extend
  model: -> Acme.Patient.find()

# Acme.PatientsNewRoute = Ember.Route.extend
#   model: -> Acme.Patient.createRecord()

