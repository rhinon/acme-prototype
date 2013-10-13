# for more details see: http://emberjs.com/guides/models/defining-models/

Acme.Vital = DS.Model.extend
  patient: DS.belongsTo 'Acme.Patient'
  bloodPressureSystolic: DS.attr 'number'
  bloodPressureDiastolic: DS.attr 'number'
  bodyTemp: DS.attr 'number'
  respiratoryRateBpm: DS.attr 'number'
  heartRateBpm: DS.attr 'number'
  createdAt: DS.attr 'date'

