class LocationsController < ApplicationController
  include SessionsHelper
  include LastfmHelper

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    if is_user_logged_in?
      @location = Location.new(location_params)
      user = get_current_user
      curloc = Location.where("latitude - #{@location.latitude} < 0.1 AND longitude - #{@location.longitude} < 0.1 AND user_id = #{user.id}").first
      unless curloc.nil?
        @location = curloc
      end
      respond_to do |format|
        if @location.save
          format.json { render :show, status: :created, location: @location }
          format.js {}
          recenttracks = get_recent_tracks(user.id, 15, @location)
          recenttracks.each do |index, track|
            music = Music.new
            music.artist_name = track['artist']['#text']
            music.location_id = @location.id
            music.track_name = track['name']
            music.save
          end
        else
          format.json { render json: @location.errors, status: :unprocessable_entity }
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
    def location_params
      params.require(:location).permit(:latitude, :longitude).merge(:user_id => session[:user_id])
    end
end
