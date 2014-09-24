require 'csv'

class DataMover
  def initialize
    @data = CSV.read('./tmp/test.csv')
  end

  def run
    created = 0
    @data.each do |row| 
      if TempMeasurement.create(row_to_hash(row))
        created += 1 
      end
    end
    if created != @data.length
      puts "Not created all measuments into DB"
    end
  end

# 2014-09-24 20:20:12,  82501,  8.25, 1,  Zew Pokój Pawła
  def row_to_hash(row)
    {
      measured_at: ActiveSupport::TimeZone["Warsaw"].parse(row[0]),
      raw: row[1],
      measurement: row[2],
      sensor_id: row[3],
      description: row[4]
    }    
  end
end
