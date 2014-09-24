require 'csv'

class DataMover
  def initialize
    @data = CSV.read('./tmp/test.csv')
  end

  def run
    created = 0
    @data.each do |row| 
      if TempMeasurement.new(row_to_hash(row)).save
        created += 1 
      end
    end
    if created != @data.length
      puts "Not created all measuments into DB"
    end
  end

  def row_to_hash(row)
    {
      measured_at: ActiveSupport::TimeZone["Warsaw"].parse(row[0]),
      raw: row[1],
      measurement: row[2],
      sensor_id: row[3],
      description: row[4].try(:trim)
    }    
  end
end
