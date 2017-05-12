module SessionsHelper
  def get_current_user
    @current_user ||= User.find(session[:user_id])
  end
  
  def is_user_logged_in?
    !session[:user_id].nil?
  end
  
  def redirect_when_not_logged_in
    unless is_user_logged_in?
      flash[:danger] = "Para acessar essa página, por favor, faça login."
    end
  end
end
