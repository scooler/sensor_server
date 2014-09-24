require_relative '../data_mover.rb'

namespace :data do
  task :move => :environment do
    DataMover.new.run
  end
end
