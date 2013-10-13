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

Acme.PatientsNewRoute = Ember.Route.extend
  model: -> Acme.Patient.createRecord()

# Acme.PatientRoute = Ember.Route.extend
#   model: (params,model) -> 
#     $.getJSON('')

Acme.VitalsNewRoute = Ember.Route.extend
  model: (params,model) -> 
    #what = Acme.Patient.find(params.patient_id)
    #what = @get('store').findQuery('patients', {id: params.patient_id})
    vital = Acme.Vital.createRecord()
    #vital.set('patient', what)

# Acme.PatientRoute = Ember.Route.extend
#   model: -> Acme.Patient.find(patient_id)