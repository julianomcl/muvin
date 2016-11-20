class UserPasswordConfigController < ApplicationController
    include SessionsHelper
    
    def new
        #se o usuario nao estiver logado, redirecione para a página principal
        if !is_user_logged_in? then
            redirect_to root_path
        end
        
        @current_user = get_current_user
        
        
    end
    
    def create
        
    end
end
