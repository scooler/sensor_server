class SensorRepresenter
  def initialize(sensor)
    @sensor = sensor
  end

  def to_json()
    {
      sensor_id: @sensor.id,
      color: @sensor.color,
      name: @sensor.name,
      measurements: measurements
    }
  end

  def measurements
    @sensor.temp_measurements.last_day.map{|m| measurement(m)}
  end

  def measurement(measurement)
    {
      measurement: measurement.measurement,
      measured_at: measurement.measured_at
    }
  end
end