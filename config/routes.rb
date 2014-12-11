Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :orders
  post "/statements/create_from_box", to: "statements#create_from_box"
  resources :statements, only: [:index]

  root to: "pages#index"
  get "/:page", to: "pages#show"

end
