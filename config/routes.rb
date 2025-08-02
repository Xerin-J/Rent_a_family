Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home" # ← Keep only one root

  get "up" => "rails/health#show", as: :rails_health_check

  # Families
  resources :families, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:index, :show, :new, :create, :update]
  end

  #Guests
  resources :guests, only: [:index]

  # Provider
  resources :providers, only: [:index, :new, :create, :update]
end

