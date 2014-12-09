class SensorRepresenter < Roar::Decorator
  include Roar::Representer::JSON
  
  property :id, as: :sensor_id
  property :color
  property :name
  collection :temp_measurements, as: :measurements, extend: SimpleTempMeasurementRepresenter, class: TempMeasurement

end