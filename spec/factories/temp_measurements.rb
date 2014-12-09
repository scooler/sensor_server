# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :temp_measurement do
    sequence(:measured_at) { |i| Time.now.beginning_of_day + i.minutes }
    raw "123456"    
    measurement 12.3
    sensor_id 56
  end
end