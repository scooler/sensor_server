class TempMeasurementRepresenter < Roar::Decorator
  include Roar::Representer::JSON

  property   :sensor_id
  property   :measured_at
  property   :measurement
  property   :description
  property   :color, exec_context: :decorator

  def color
    represented.sensor.color
  end
end