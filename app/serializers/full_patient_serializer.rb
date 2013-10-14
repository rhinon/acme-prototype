class FullPatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :bed_number, :mrn
  has_many :vitals, include: true

  self.root = 'patient'
end
