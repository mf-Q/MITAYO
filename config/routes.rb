Rails.application.routes.draw do
  devise_for :users
  
  root  'products#index'
  resources :products, only: [:index, :show, :edit, :new, :create, :update]
  resources :users, only: [:edit, :update]
end
