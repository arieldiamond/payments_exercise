Rails.application.routes.draw do
  mount API::Base, at: "/"

  resources :loans, defaults: {format: :json}
end
