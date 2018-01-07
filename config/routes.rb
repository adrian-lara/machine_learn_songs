Rails.application.routes.draw do

  get '/', to: "welcome#index", as: :root

  get "/spotify/callback", to: "session#create"

  delete '/logout', to: "session#destroy", as: :logout

  get "/dashboard", to: "users/dashboard#index", as: :dashboard

end
