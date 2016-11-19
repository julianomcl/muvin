class UserConfigurationController < ApplicationController
    include SessionsHelper
    
  def updateemail
    @user = get_current_user
    if is_user_logged_in? && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
    else
      redirect_to '/login'
    end 
  end
  
  def create

  end
  
end
