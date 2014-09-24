class LastMeasurementsController < ApplicationController
  respond_to :json

  def index
    respond_with TempMeasurement.last_day
  end
end
