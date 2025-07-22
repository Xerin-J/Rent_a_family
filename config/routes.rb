Rails.application.routes.draw do
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "family", to: "families#index"
  get "family/:id", to: "families#show"
  get "family/request", to: "families#new"
  post "family", to: "families#create"

  get "bookings", to: "bookings#index"
  patch "bookings/:id", to: "bookings#update"

  get "provider/new", to: "provider#new"
  post "provider", to: "provider#create"
  get "provider", to: "provider#index"
  get "provider/:id", to: "provider#show"
  patch "provider/:id", to: "provider#update"
end
