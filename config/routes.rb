Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #standard pages
  
  get "/", to: "pages#welcome", as: "root"
  get "/home", to: "pages#home", as: "home"
  get "/explore", to: "pages#explore", as: "explore"
  # get "/learn", to: "pages#learn", as: "learn"
  get "/contact", to: "pages#contact", as: "contact"

  # explore results
  get "/results/all", to: "contents#index", as: "results_all"
  get "/results/genres", to: "genres#index", as: "genres"
  get "/results/genres/:id", to: "genres#filter", as: "genre"
  get "/results/mediums", to: "mediums#index", as: "mediums"
  get "/results/mediums/:id", to: "mediums#filter", as: "medium"
  get "/results/artists", to: "artists#index", as: "artists"
  get "/contents", to: "contents#index", as: "contents"

  # buy page (when artwork clicked on)
  get "/results/artwork/:id", to: "contents#show", as: "artwork"
  get "/results/artwork/:id/edit", to: "contents#edit", as: "edit_artwork"

  #payment
  get "/payment-successful", to: "orders#success", as: "payment_success"
  post "/webhook", to: "orders#webhook", as: "order"
  #sell
  get "/sell", to: "contents#new", as: "new_content"
  post "/contents", to: "contents#create"
  patch "/sell/:id", to: "contents#update"


  get "/profile", to: "pages#profile", as: "profile"
  patch "/profile", to: "pages#profile_edit"

end
