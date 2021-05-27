Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  root to: 'pages#home'
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
