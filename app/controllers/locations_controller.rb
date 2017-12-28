class LocationsController < ApplicationController
  def index
    result = Geocoding.new(params[:address]).location

    if result.success?
      render json: result, status: 200
    else
      render json: { error: result.message }, status: result.code
    end
  end
end
