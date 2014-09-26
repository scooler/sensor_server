class TempMeasurementRepresenter
  def initialize(measurement)
    @measurement = measurement
  end

  def to_json()
    {
      sensor_id: @measurement.sensor_id,
      measured_at: @measurement.measured_at,
      color: @measurement.sensor.color,
      measurement: @measurement.measurement,
      description: @measurement.description,
    }
  end
end