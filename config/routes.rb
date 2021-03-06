Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  namespace :prototypes do
    resources :newest, only: [:index]
  end
  scope module: :prototypes do
    resources :tags, only: [:index, :show]
  end
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :users, only: [:edit, :show, :update]
end
