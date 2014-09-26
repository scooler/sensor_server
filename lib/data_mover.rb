require 'csv'

class DataMover
  def initialize
    @data = CSV.read('./tmp/test.csv')
    @created = 0
  end

  def run
    @data.each do |row| 
      tm = create_temp_measurement(row)
      find_or_create_sensor(tm)
    end
    if @created != @data.length
      puts "Not created all measuments into DB"
    end
  end

  def create_temp_measurement(row)
    tm = TempMeasurement.new(row_to_hash(row))
    if tm.save
      @created += 1 
    end
    tm
  end

  def find_or_create_sensor(tm)
    sensor = Sensor.where(id: tm.sensor_id).first_or_initialize
    if sensor.new_record?
      sensor.name = tm.description
      sensor.save!
      puts "CREATED NEW SENSOR - setup a color"
    end
  end

  def row_to_hash(row)
    {
      measured_at: ActiveSupport::TimeZone["Warsaw"].parse(row[0]),
      raw: row[1],
      measurement: row[2],
      sensor_id: row[3],
      description: row[4].try(:strip)
    }    
  end
end
