require "spec_helper"
require "data_mover"

RSpec.describe DataMover do
  let (:data_mover) { DataMover.new }
  describe "#row_to_hash" do
    let (:entry_row) {["2014-12-08 22:58:55", "123456", "12.3", "56", "Some description"]}
    let (:proper_return_keys) {[:measured_at, :raw, :measurement, :sensor_id, :description]}
    context "empty data" do
      it "accepts empty measured_at" do
        entry_row[0] = ""
        hash = data_mover.row_to_hash(entry_row)
        expect(hash.keys).to eq(proper_return_keys)
      end

      it "accepts empty raw" do
        entry_row[1] = ""
        hash = data_mover.row_to_hash(entry_row)
        expect(hash.keys).to eq(proper_return_keys)
      end

      it "accepts empty measurement" do
        entry_row[2] = ""
        hash = data_mover.row_to_hash(entry_row)
        expect(hash.keys).to eq(proper_return_keys)
      end

      it "accepts empty sensor_id" do
        entry_row[3] = ""
        hash = data_mover.row_to_hash(entry_row)
        expect(hash.keys).to eq(proper_return_keys)
      end

      it "accepts empty description" do
        entry_row[4] = ""
        hash = data_mover.row_to_hash(entry_row)
        expect(hash.keys).to eq(proper_return_keys)
      end
    end
  end

  describe "#find_or_create_sensor" do
    it "creates new sensor if non such exists" do
      expect {
        data_mover.find_or_create_sensor(FactoryGirl.build(:temp_measurement))
      }.to change{ Sensor.count }.by(1)
    end

    it "doesn't create a sensor when given is in DB" do
      data_mover.find_or_create_sensor(FactoryGirl.build(:temp_measurement))
      expect {
        data_mover.find_or_create_sensor(FactoryGirl.build(:temp_measurement, measurement: 10))
      }.to_not change{ Sensor.count }
    end
  end
end