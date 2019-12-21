Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root  'products#index'
  resources :products
  resources :users, only: [:edit, :update]
end
