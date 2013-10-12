class FullPatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :bed_number
end
