class PatientSerializer < ActiveModel::Serializer
  embed :ids, include: false
  attributes :id, :first_name, :last_name, :bed_number, :mrn
  has_many :vitals
end
