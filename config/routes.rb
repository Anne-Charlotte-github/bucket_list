Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'current_profile#index'
  resources :dreams, only: %I[create new edit update destroy]
end
