class LastMeasurementsController < ApplicationController
  respond_to :json

  def index
    respond_with TempMeasurement.last(100).map{|tm| TempMeasurementRepresenter.new(tm).to_json }
  end
end
