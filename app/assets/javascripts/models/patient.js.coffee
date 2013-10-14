Acme.Patient = Ember.Model.extend
  first_name: Ember.attr()
  last_name: Ember.attr()
  bed_number: Ember.attr()
  mrn: Ember.attr()
  vitals: Ember.hasMany('Acme.Vital', {key: 'vitals', embedded: true})

  last_vital: ( ->
    vitals = @get('vitals').toArray()
    if (vitals? && vitals.length > 0)
      return vitals[0]
    return null
  ).property('vitals.@each')

  full_lowercase_name: ( ->
    return @get('first_name').toLowerCase() + " " + @get('last_name').toLowerCase()
  ).property('first_name', 'last_name')

Acme.Patient.adapter = Ember.RESTAdapter.create()
Acme.Patient.url = "patients"
Acme.Patient.rootKey = "patient"
Acme.Patient.collectionKey = "patients"