Rails.application.routes.draw do
  get 'memberships/create'
  get 'memberships/update'
  get 'memberships/delete'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'current_profile#index'
  resources :dreams, only: %I[create show new edit update destroy]
  resources :profiles, only: %I[show]
  resources :friendships, only: %I[index]
  resources :memberships, only: %I[create update destroy]

end
