Rails.application.routes.draw do
  root to: "static_pages#home"

  get "/register", to: "users#new"

  get "/signout", to: "sessions#destroy", as: :signout
  get "/auth/:provider/callback", to: "sessions#create"

  resource :subscription
end
