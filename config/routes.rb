Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #STATIC pages
  
  get "/", to: "pages#welcome", as: "root"
  get "/home", to: "pages#home", as: "home"
  get "/explore", to: "pages#explore", as: "explore"
  # get "/learn", to: "pages#learn", as: "learn" #this was a sprinkle
  get "/contact", to: "pages#contact", as: "contact"

  # FILTER RESULTS

  get "/results/all", to: "contents#index", as: "results_all"
  get "/results/genres", to: "genres#index", as: "genres"
  get "/results/genres/:id", to: "genres#filter", as: "genre"
  get "/results/mediums", to: "mediums#index", as: "mediums"
  get "/results/mediums/:id", to: "mediums#filter", as: "medium"
  get "/results/artists", to: "artists#index", as: "artists"
  get "/contents", to: "contents#index", as: "contents"

  # ARTWORK CRUD

  get "/results/artwork/:id", to: "contents#show", as: "content"
  get "/sell", to: "contents#new", as: "new_content"
  post "/contents", to: "contents#create"
  get "/results/artwork/:id/edit", to: "contents#edit", as: "edit_content"
  patch "/results/artwork/:id", to: "contents#update"
  delete "/results/artwork/:id", to: "contents#destroy", as: "delete_content"

  #PAYMENT

  get "/orders/success", to: "orders#success", as: "payment_success"
  post "/webhook", to: "orders#webhook", as: "order"

 #PROFILE CRUD
  get "/profile", to: "profiles#index", as: "profile"
  get "/profile/edit", to: "profiles#edit", as: "edit_profile"
  get "/profile/:id", to: "artists#show", as: "profile_id"
  patch "/profile", to: "profiles#update"
  delete "/profile", to: "profiles#destroy", as: "delete_profile"

end
