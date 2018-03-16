Rails.application.routes.draw do
    resources :posts
  devise_for :users
  root to: 'posts#index'
  #get '/users', to: 'users#index'
   #get '/users/index'
#get '/users', to: 'users#index'
  #below is for devise added after wathcing video
  #root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
