require "spec_helper"
require "data_mover"

RSpec.describe DataMover do
  describe "#row_to_hash" do
    context "empty data" do
      it "accepts empty measured_at"
      it "accepts empty raw"
      it "accepts empty measurement"
      it "accepts empty sensor_id"
      it "accepts empty description"
    end
  end

  describe "#find_or_create_sensor" do
    it "creates new sensor if non such exists"
    it "doesn't create a sensor when give is in DB"
  end
end