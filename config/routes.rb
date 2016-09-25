Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:edit, :show, :update]
  resources :users
end
