Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home" # ← Keep only one root

  get "up" => "rails/health#show", as: :rails_health_check

  # Families
  resources :families, only: [:index, :show, :create] do
    resources :bookings, only: [:index, :show, :new, :create]
  end
  # get "family", to: "families#index", as: "families"
  # get "family/request", to: "families#new", as: "new_family"
  # post "family", to: "families#create", as: "create_family"
  # get "family/:id", to: "families#show", as: "family"

  # Bookings
  # get "bookings", to: "bookings#index", as: "bookings"
  # get "bookings/new", to: "bookings#new", as: "new_booking"

  # Provider
  resources :providers, only: [:index, :show, :new, :create, :update]
  # get "provider/new", to: "provider#new", as: "new_provider"
  # post "provider", to: "provider#create", as: "create_provider"
  # get "provider", to: "provider#index", as: "providers"
  # get "provider/:id", to: "provider#show", as: "provider"
  # patch "provider/:id", to: "provider#update", as: "update_provider"
end