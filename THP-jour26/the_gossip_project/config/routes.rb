Rails.application.routes.draw do

  root "home#index"

  get "/", to: "home#index"

  get "/team", to: "home#team"

  get "/contact", to: "home#contact"

  get "/new_gossips", to: "home#new"

  post "/new_gossips", to: "home#create"

  get "/gossip/:id", to: "home#show", as: "gossip"

  get "/user", to: "user#index"
  
  get "/user/:id", to: "user#show", as: "user_id"

  get "/:firstname", to: "home#index"

end
