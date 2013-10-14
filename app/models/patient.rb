class Patient < ActiveRecord::Base
  has_many :vitals

  validates_presence_of :first_name, :last_name, :mrn, :bed_number
end
