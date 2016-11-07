class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def show
    
    
  @user = User.find_by(id: session[:user_id])

  if @user.nil? then
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
