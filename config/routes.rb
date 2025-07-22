Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "families#index"

  # Families
  get "family", to: "families#index", as: "families"
  get "family/request", to: "families#new", as: "new_family"
  post "family", to: "families#create", as: "create_family"
  get "family/:id", to: "families#show", as: "family"

  # Bookings
  get "bookings", to: "bookings#index", as: "bookings"
  patch "bookings/:id", to: "bookings#update", as: "update_booking"

  # Providers
  get "provider/new", to: "provider#new", as: "new_provider"
  post "provider", to: "provider#create", as: "create_provider"
  get "provider", to: "provider#index", as: "providers"
  get "provider/:id", to: "provider#show", as: "provider"
  patch "provider/:id", to: "provider#update", as: "update_provider"
end