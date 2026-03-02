Rails.application.routes.draw do
  # Auth
  resource :session
  resources :users, only: [ :new, :create ]
  resources :passwords, param: :token

  # Core resources
  resources :ingredients
  resources :recipes

  # Week 4
  resources :inventory_items
  resources :batches

  # Dashboard
  get "dashboards/show"
  root "dashboards#show"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
