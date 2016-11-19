class UserConfigurationController < ApplicationController
    include SessionsHelper
    
  def new
  
  end
    
  def updateemail
    @user = get_current_user
    if is_user_logged_in? && @user.authenticate(@user.password)
      session[:user_id] = @user.id
    else
      redirect_to '/login'
    end 
  end
  
  def create

  end
  
end
