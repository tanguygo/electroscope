Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :orders
  get "/statements/create_from_box", to: "statements#create_from_box"
  resources :statements, only: [:index]
  get "/activation", to: "box_sessions#new"
  resources :box_sessions, only: [:create]

  resources :profile, only: [:edit, :update]
  root to: "pages#index"
  resources :flats do
    resources :devices, only:  [:index, :new, :create]
    post "/devices/create_multiple", to: "devices#create_multiple"
  end
  get "/:page", to: "pages#show"

end
