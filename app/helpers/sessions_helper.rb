module SessionsHelper
  def get_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def is_user_logged_in?
    !session[:user_id].nil?
  end
end
