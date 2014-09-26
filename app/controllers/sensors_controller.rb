class SensorsController < ApplicationController
  respond_to :json
  def last_measurements
    respond_with Sensor.all.map{|s| SensorRepresenter.new(s).to_json}
  end

end
