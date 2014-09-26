class LastMeasurementsController < ApplicationController
  respond_to :json

  def index
    respond_with TempMeasurement.last(100)
  end
end
