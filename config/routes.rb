Rails.application.routes.draw do

  get '/', to: "welcome#index", as: :root

end
