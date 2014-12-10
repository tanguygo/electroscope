Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#index"
  get "/:page", to: "pages#show"
  resources :orders
  resources :statements, only: [:index,:show,:new,:create]
  get "/statements/create_from_box", to: "statements#create_from_box"
end
