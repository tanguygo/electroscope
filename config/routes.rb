Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :orders
  # pour créer localement, uncomment next line
  # get "/statements/create_from_box", to: "statements#create_from_box"
  post "/statements/create_from_box", to: "statements#create_from_box"
  resources :statements, only: [:index]
  resources :profiles, only: [:show, :edit, :update]
  resources :sponsorships, only: [:show, :new, :create]
  get "/activation", to: "box_sessions#new"
  resources :box_sessions, only: [:create]
  root to: "pages#index"
  resources :flats do
    resources :devices, only:  [:index, :new, :create]
    post "/devices/create_multiple", to: "devices#create_multiple"
  end
  get "/:page", to: "pages#show"

end


