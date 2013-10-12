class VitalSerializer < ActiveModel::Serializer
  attributes :id, :blood_pressure_systolic, :blood_pressure_diastolic, :body_temp, :respiratory_rate_bpm, :heart_rate_bpm
  has_one :patient
end
