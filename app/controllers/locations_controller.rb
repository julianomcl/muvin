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
      curloc = Location.where("abs(abs(latitude) - ?) < 0.001 AND abs(abs(longitude) - ?) < 0.001 
            AND DATE_PART('day', ? - created_at) < 7 AND user_id = ?", 
            @location.latitude.abs, @location.longitude.abs, DateTime.now, user.id)
          .first
      unless curloc.nil?
        @location = curloc
      end
      respond_to do |format|
        if @location.save
          format.json { render :show, status: :created, location: @location }
          format.js {}
          if user.lastfm_username.nil? or user.lastfm_username.blank?
            if user.spotify.blank?
              redirect_to '/auth/spotify'
            else
              unless Music.where("location_id = ? AND DATE_PART('day', ? - created_at) > 7", 
                  @location.id, DateTime.now).first.nil?
                user_spotify = RSpotify::User.new(user.spotify)
                top_tracks = user_spotify.top_tracks(time_range: 'short_term')
                top_tracks.each do |track|
                  music = Music.new
                  music.artist_name = track.artists.first.name
                  music.location_id = @location.id
                  music.track_name = track.name
                  music.save
                end
              end
            end
          else
            recent_tracks = get_recent_tracks(user.id, 15, @location)
            recent_tracks.each do |_index, track|
              music = Music.new
              music.artist_name = track['artist']['#text']
              music.location_id = @location.id
              music.track_name = track['name']
              music.save
            end
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
