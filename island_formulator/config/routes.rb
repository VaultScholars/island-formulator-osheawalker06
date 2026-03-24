Rails.application.routes.draw do
  resources :recipes do
    resource :favorite, only: [ :create, :destroy ]
  end

  resources :favorites, only: [ :index ]

  resource :session
  resources :users, only: [ :new, :create ]
  resources :passwords, param: :token

  resources :ingredients
  resources :inventory_items
  resources :batches

  get "dashboards/show"
  root "dashboards#show"

  get "up" => "rails/health#show", as: :rails_health_check
end
