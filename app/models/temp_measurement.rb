class TempMeasurement < ActiveRecord::Base
  validate :measured_at, presence: true, uniqueness: {scope: :sensor_id}
  validates :raw, :presence => true
  validates :measurement, :presence => true
  validates :sensor_id, :presence => true
end
