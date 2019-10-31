Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#welcome", as: "welcome"
  get "/home", to: "pages#home", as: "home"
  get "/explore", to: "pages#explore", as: "explore"

  # explore results
  get "/results", to: "pages#results_all", as: "results_all"
  get "/results/genres", to: "genres#index", as: "genres"
  get "/results/genres/:id", to: "genres#filter"
  get "/results/medium", to: "mediums#index", as: "mediums"
  get "/results/artists", to: "artists#index", as: "artists"
  # buy page (when artwork clicked on)
  get "/results/:id/:id/:id", to: "pages#show", as: "artwork"

  get "/payment-successful", to: "pages#payment_success", as: "payment_success"
  get "/contact", to: "pages#contact", as: "contact"
  get "/sell", to: "pages#sell", as: "sell"
  post "/sell", to: "pages#create"
  get "/profile", to: "pages#profile", as: "profile"
  put "/profile", to: "pages#profile_edit"
end
