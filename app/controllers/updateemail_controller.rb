class UpdateemailController < ApplicationController
  include SessionsHelper
  
  def updateemail
    if !is_user_logged_in? then
      redirect_to login_path
    end
  end
  
  def create
    @user = User.find_by_email(params[:session][:email]).new
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/updateemail'
    else
      redirect_to '/login'
    end 
  end
  
  def destroy
    session[:user_id] = nil 
    redirect_to '/' 
  end

end
