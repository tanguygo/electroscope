Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :orders
  post "/statements/create_from_box", to: "statements#create_from_box"
  resources :statements, only: [:index]
  resources :profile, only: [:show, :edit, :update]
  resources :sponsorship, only: [:show, :new, :create]
  get "/activation", to: "box_sessions#new"
  resources :box_sessions, only: [:create]
  root to: "pages#index"
  resources :flats do
    resources :devices, only:  [:index, :new, :create]
    post "/devices/create_multiple", to: "devices#create_multiple"
  end
  get "/:page", to: "pages#show"

end
