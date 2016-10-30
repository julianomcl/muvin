class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Bem-vindo ao Muvin!'
      session[:user_id] = @user.id
      redirect_to '/'
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
