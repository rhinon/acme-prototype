Acme.Patient = Ember.Model.extend({
  first_name: Ember.attr(),
  last_name: Ember.attr(),
  bed_number: Ember.attr(),
  mrn: Ember.attr(),
  vitals: Ember.hasMany('Acme.Vital', {key: 'vital_ids'})
});

Acme.Patient.adapter = Ember.RESTAdapter.create();
Acme.Patient.url = "patients";
Acme.Patient.rootKey = "patient";
Acme.Patient.collectionKey = "patients";