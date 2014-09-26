class Sensor < ActiveRecord::Base
  has_many :temp_measurements
end
