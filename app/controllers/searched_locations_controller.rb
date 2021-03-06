class SearchedLocationsController < ApplicationController
  include SessionsHelper

  def index
    @searched_locations = SearchedLocation.all
  end

  def new
    @searched_location = SearchedLocation.new
  end

  def create
    if is_user_logged_in?
      @searched_location = SearchedLocation.new(searched_location_params)
      @location = Location.get_location_nearby(@searched_location)

      respond_to do |format|
        if @searched_location.save
          format.json { render :show, status: :created, location: @location }
          format.js {}
        else
          format.json { render json: @searched_location.errors, status: :unprocessable_entity }
          format.js {}
        end
      end
    else
      respond_to do |format|
        format.json { render :index }
        format.js {}
      end
    end
  end

  private
    def searched_location_params
      params.require(:searched_location).permit(:latitude, :longitude).merge(:user_id => session[:user_id])
    end
end
