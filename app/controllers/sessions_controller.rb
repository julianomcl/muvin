class SessionsController < ApplicationController
  def new
    if is_user_logged_in?
      redirect_to root_path
    end
  end
  
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Credenciais incorretas!"
      redirect_to '/login'
    end
  end
  
  def destroy
    session[:user_id] = nil 
    redirect_to '/' 
  end

end