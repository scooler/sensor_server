class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :color, default: "200,200,200"
      t.string :sensor_type, default: "temperature"

      t.timestamps
    end
  end
end
