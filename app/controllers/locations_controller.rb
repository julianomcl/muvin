class LocationsController < ApplicationController
  include SessionsHelper

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        format.json { render :show, status: :created, location: @location }
        format.js {}
      else
        format.json { render json: @location.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private
    def location_params
      params.require(:location).permit(:latitude, :longitude).merge(:user_id => session[:user_id])
    end

end
