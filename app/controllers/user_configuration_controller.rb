class UserConfigurationController < ApplicationController
    include SessionsHelper
    
  def new
    @user ||= get_current_user
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
  
  def newlastfmaccountsync
    @user ||= get_current_user
    redirect_when_not_logged_in
  end
  
  def createlastfmaccountsync
    @user ||= get_current_user
    @user.update_attribute(:lastfm_username, params[:user][:lastfm_username])
    redirect_to 'http://www.last.fm/api/auth/?api_key=5da1c00d06ef449b8c672b4be3ebda79&cb=' + request.base_url + mysettings_path #url_for(:only_path => false) #request.base_url #criar helper para key api
  end
  
end
