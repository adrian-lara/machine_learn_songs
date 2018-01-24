Rails.application.routes.draw do

  get '/', to: "welcome#index", as: :root

  get "/spotify/callback", to: "session#create"

  delete '/logout', to: "session#destroy", as: :logout

  get "/predict", to: "users/predict#index", as: :predict
  get "/learn", to: "users/learn#index", as: :learn

  post "/track_characters", to: "users/track_characters#create", as: :save_track

end
