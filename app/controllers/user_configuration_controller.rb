class UserConfigurationController < ApplicationController
    include SessionsHelper
    
  def new
  
  end
    
  def updateemail
    @user ||= get_current_user
    if @user.nil?
      flash[:danger] = "Por favor, faça login antes de alterar alguma configuração"
      redirect_to '/login'
    end 
  end
  
  def create

  end
  
end
