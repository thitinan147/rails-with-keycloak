Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#login"
  get "/auth/callback", to: "sessions#callback"
  get "logout", to: "sessions#logout"
  get '/userinfo', to: 'sessions#userinfo'
end
