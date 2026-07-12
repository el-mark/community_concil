Rails.application.routes.draw do
  root "issues#new"

  resources :issues, only: [:index, :new, :create]

  get  "signup", to: "users#new"
  post "signup", to: "users#create"

  get "verify/:token", to: "verifications#show", as: :verify

  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
