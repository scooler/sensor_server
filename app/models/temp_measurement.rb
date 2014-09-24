class TempMeasurement < ActiveRecord::Base
  validate :measured_at, presence: true, uniqueness: {scope: :sensor_id}
  validates :raw, :presence => true
  validates :measurement, :presence => true
  validates :sensor_id, :presence => true
  
  scope :last_day, -> { where("measured_at > ?", Time.now - 1.day) }
end
