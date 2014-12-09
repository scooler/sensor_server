class SensorsController < ApplicationController
  respond_to :json

  def last_measurements
    sensors = Sensor.with_limited_measurements
    respond_with SensorsRepresenter.new(sensors)
  end

end
