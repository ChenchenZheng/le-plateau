Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  root to: 'pages#home'
  resources :events do
    resources :participations, only: [ :new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
