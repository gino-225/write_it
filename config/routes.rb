Rails.application.routes.draw do
  devise_for :users
   get 'users/index'
   get 'posts/index'

  #below is for devise added after wathcing video
  #root 'home#index'
  resources :posts, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
