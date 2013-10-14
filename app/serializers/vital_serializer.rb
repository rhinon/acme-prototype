class VitalSerializer < ActiveModel::Serializer
  #embed :ids, include: false
  attributes :id, :patient_id, :blood_pressure_systolic, :blood_pressure_diastolic, :body_temp, :respiratory_rate_bpm, :heart_rate_bpm, :created_at
  #has_one :patient, include: false
end
