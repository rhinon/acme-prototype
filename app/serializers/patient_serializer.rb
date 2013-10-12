class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :bed_number
  has_many :vitals
end
