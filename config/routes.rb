Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show, :update]

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  resources :boardgames, only: [:new, :create, :show] do
    get :scan_barcode, on: :collection
    post :import_boardgame, on: :collection
  end

  resources :events do
    resources :participations, only: [:new, :create, :destroy]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    resources :participations, only: [:new, :create]
    resources :reviews, only: [:index, :edit, :update]
  end

  resources :participations, only: [:edit, :update, :destroy] do
    member do
      get :accept
      get :decline
    end
  end

end
