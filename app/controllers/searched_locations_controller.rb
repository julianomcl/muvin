class SearchedLocationsController < ApplicationController
  include SessionsHelper

  def index
    @searched_locations = SearchedLocation.all
  end

  def new
    @searched_location = SearchedLocation.new
  end

  def create
    @searched_location = SearchedLocation.new(searched_location_params)

    respond_to do |format|
      if @searched_location.save
        format.json { render :show, status: :created, location: @searched_location }
        format.js {}
      else
        format.json { render json: @searched_location.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private
    def searched_location_params
      params.require(:searched_location).permit(:latitude, :longitude).merge(:user_id => session[:user_id])
    end
end
