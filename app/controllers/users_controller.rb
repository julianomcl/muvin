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

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :password, :password_confirmation, :lastfm_username)
    end
end
