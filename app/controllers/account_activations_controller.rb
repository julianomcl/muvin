class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated?
      # && user.authenticated?(:activation, params[:id])
      user.activate
      # log_in user
      flash[:success] = 'Conta ativada!'
    else
      flash[:danger] = 'Link de ativação inválido'
    end
    redirect_to root_url
  end
end
