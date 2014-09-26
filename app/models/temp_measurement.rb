class TempMeasurement < ActiveRecord::Base
  belongs_to :sensor

  validate :measured_at, presence: true
  validate :duplicate_measurement
  validate :raw, presence: true
  validate :measurement, presence: true
  validate :sensor_id, presence: true

  scope :last_day, -> { where("measured_at > ?", Time.now - 1.day) }
  scope :time_similar, lambda { |time| where("measured_at < ? AND measured_at > ?", time + 1.second, time - 1.second)}

  def duplicate_measurement
    errors.add(:measured_at, "Duplicated measurement") if self.class.time_similar(measured_at).exists?(sensor_id: sensor_id)
  end
end
