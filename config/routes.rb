Rails.application.routes.draw do
  root "issues#index"

  resources :issues, only: [:index, :new, :create]

  get  "signup", to: "users#new"
  post "signup", to: "users#create"

  get  "login", to: "sessions#new"
  post "login", to: "sessions#create"

  get "verify/:token", to: "verifications#show", as: :verify

  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
