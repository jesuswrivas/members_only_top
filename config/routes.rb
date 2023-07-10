Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'

  devise_for :users
 
  root "pages#main"


  
  resources :users do
    resources :posts, except: :show
  end
  
  resources :posts, only: [:show] do
    resources :comments
  end


end

