Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :update]

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  resources :boardgames, only: [:new, :create]

  resources :events do
    resources :participations, only: [:new, :create, :destroy]
  end

  resources :participations, only: [:edit, :update, :destroy] do
    member do
      get :accept
      get :decline
    end
  end

end
