class PatientSerializer < ActiveModel::Serializer
  embed :ids, include: false
  attributes :id, :first_name, :last_name, :bed_number
  has_many :vitals
end
