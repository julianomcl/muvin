class WelcomeController < ApplicationController
  include LastfmHelper
  
  def index
    @spotify_musics = []
    if is_user_logged_in?
      location = Location.find_by(:user_id => session[:user_id])
      puts "location do user: #{location}"
      if location != nil
        musics = Music.get_most_played(location)
        puts "musics do cara: #{musics}"

        musics.each do |music|
          m = RSpotify::Track.search(music[0]).first
          @spotify_musics.push(m) unless m.nil?
        end
      end
    end
  end
end
