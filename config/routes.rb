Rails.application.routes.draw do
  devise_for :users
  root  'blogs#index'
  resources :blogs do
    resources :comments, only: [:create]
    get :search, on: :collection
  end
  resources :users, only: [:show]
end
