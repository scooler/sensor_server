class CreateTempMeasurements < ActiveRecord::Migration
  def change
    create_table :temp_measurements do |t|
      t.integer :raw
      t.datetime :measured_at
      t.string :description
      t.integer :sensor_id
      t.float :measurement

      t.timestamps
    end
  end
end
