class Vital < ActiveRecord::Base
  belongs_to :patient

  validates_presence_of :patient, :blood_pressure_systolic, :blood_pressure_diastolic, :body_temp, :respiratory_rate_bpm, :heart_rate_bpm
end
