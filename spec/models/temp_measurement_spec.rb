require 'spec_helper'

RSpec.describe TempMeasurement, :type => :model do
  
  describe "validation" do
    it "doesn't allow two measurements too close together (to prevent duplication when loading)" do
      measurement = FactoryGirl.create(:temp_measurement)
      expect(
        FactoryGirl.build(:temp_measurement, measured_at: measurement.measured_at)
      ).to_not be_valid
    end
  end
end
