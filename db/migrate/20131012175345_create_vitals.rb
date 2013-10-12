class CreateVitals < ActiveRecord::Migration
  def change
    create_table :vitals do |t|
      t.references :patient, index: true
      t.integer :blood_pressure_systolic
      t.integer :blood_pressure_diastolic
      t.decimal :body_temp, precision: 4, scale: 1
      t.integer :respiratory_rate_bpm
      t.integer :heart_rate_bpm

      t.timestamps
    end
  end
end
