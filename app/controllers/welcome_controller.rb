class WelcomeController < ApplicationController
  include LastfmHelper
  
  def index
    if is_user_logged_in?
      if session[:hash] == nil
        redirect_to '/auth/spotify'
      else
        @spotify_musics = []
        location = Location.find_by(:user_id => session[:user_id])
        if location != nil
          @locations = nil
          @locations = Location.get_by_distance(location, 1)
          @locations = Location.get_by_distance(location, 10) if @locations.blank?
          @spotify_user = RSpotify::User.new(session[:hash])
          musics = Music.get_musics_by_location(location)
          
          musics.each do |music|
            m = RSpotify::Track.search(music.track_name).first
            @spotify_musics.push(m) unless m.nil?
          end
        end
      end
    else
      @spotify_musics = []
    end
  end
end
