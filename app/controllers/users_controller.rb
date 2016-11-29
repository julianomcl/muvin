class UsersController < ApplicationController
  include SessionsHelper
  
  def new
    @user = User.new
  end
  
  def show
    unless is_user_logged_in?
      redirect_to '/login' 
    end
    
    @user = User.find_by(id: session[:user_id])
    
    if @user.nil?
      redirect_to '/login'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Por favor, verifique seu e-mail para ativar a sua conta.'
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    hash = spotify_user.to_hash
    @user = User.find_by(:id => session[:user_id])
    @user.spotify = request.env['omniauth.auth']
    @abc = request.env['omniauth.auth']
    @user.save
    session[:hash] = hash
    
    @spotify_user = RSpotify::User.new(hash)
    
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :password, :password_confirmation, :lastfm_username)
    end
end
