class WelcomeController < ApplicationController
  include LastfmHelper
  
  def index
    @spotify_user = RSpotify::User.new(session[:hash])
  end
end
