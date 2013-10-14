# for more details see: http://emberjs.com/guides/models/defining-models/

Acme.Vital = Ember.Model.extend
  patient: Ember.belongsTo('Acme.Patient', {key: 'patient_id'})
  blood_pressure_systolic: Ember.attr()
  blood_pressure_diastolic: Ember.attr()
  body_temp: Ember.attr()
  respiratory_rate_bpm: Ember.attr()
  heart_rate_bpm: Ember.attr()
  created_at: Ember.attr()

Acme.Vital.adapter = Ember.RESTAdapter.create()
#   createRecord: (record) ->
#     patientId = record.get('patient').get('id')

#     @ajax('patients/'+ patientId + '/vitals.json', record.toJSON(), "POST").then( (data) ->
#       @didCreateRecord(record, data)
#       return record
#     )
# )
Acme.Vital.url = "vitals"
Acme.Vital.rootKey = 'vital'
Acme.Vital.collectionKey = "vitals"