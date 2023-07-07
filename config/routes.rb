Rails.application.routes.draw do

  devise_for :users
 
  root "pages#main"


  
  resources :users do
    resources :posts, except: :show
  end
  
  resources :users, only: [:show]


end

