Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  get 'profil', to: 'pages#profil'

  resources :users, only: [:show]
  
  resources :events do
    resources :participations, only: [:new, :create]
  end

  resources :participations, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :accept
      get :decline
    end
  end

end
