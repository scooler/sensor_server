class Sensor < ActiveRecord::Base
  has_many :temp_measurements, -> { order(:measured_at) }

  def self.with_limited_measurements
    scoped.includes(:temp_measurements).where("temp_measurements.measured_at > ?", Time.now - 1.month)
    .order("temp_measurements.measured_at")
  end
end
