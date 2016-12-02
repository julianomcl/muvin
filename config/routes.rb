Rails.application.routes.draw do
  
  # get 'index' => 'welcome#index'
  # get '/' => 'welcome#index'
  get '/signup' => 'users#new', as: :sign_up
  post '/signup' => 'users#create'
  resources :users
  resources :locations
  resources :searched_locations
  resources :musics
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  post '/spotify/playlist' => 'users#playlist', as: :spotify_playlist

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  
  get '/auth/spotify/callback', to: 'users#spotify'

  post '/musics/most-played' => 'musics#most_played'

  get 'mysettings' => 'user_configuration#new'
  get 'mysettings/configurelastfm' => 'user_configuration#newlastfmaccountsync', as: :mysettings_configurelastfm
  patch 'mysettings/configurelastfm' => 'user_configuration#createlastfmaccountsync'
  
  get '/api/auth' => 'user_configuration#new'
  
  get 'configurationviewer' => 'users#show'
  
  get 'updateemail' => 'user_configuration#updateemail'
  
  post 'updateemail' => 'user_configuration#create'
  
  
  delete 'logout' => 'sessions#destroy'
  
  get 'changepassword' => 'user_password_config#new' 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

