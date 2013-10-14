# for more details see: http://emberjs.com/guides/models/defining-models/

Acme.Vital = Ember.Model.extend
  patient: Ember.belongsTo('Acme.Patient', {key: 'patient_id'})
  blood_pressure_systolic: Ember.attr()
  blood_pressure_diastolic: Ember.attr()
  body_temp: Ember.attr(Number)
  respiratory_rate_bpm: Ember.attr()
  heart_rate_bpm: Ember.attr()
  created_at: Ember.attr(Date)

  pretty_created_at: ( ->
    moment(@get('created_at')).zone("-04:00").format('M/D h:mm a')
  ).property('created_at')

Acme.Vital.adapter = Ember.RESTAdapter.create()
Acme.Vital.url = "vitals"
Acme.Vital.rootKey = 'vital'
Acme.Vital.collectionKey = "vitals"