class SensorsRepresenter < Roar::Decorator
  include Representable::JSON::Collection

  items extend: SensorRepresenter
end