class AddMrnToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :mrn, :integer
  end
end
