Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#index"
  resources :flats do
    resources :devices, only:  [:index, :new, :create]
    post "/devices/create_multiple", to: "devices#create_multiple"
  end
  get "/:page", to: "pages#show"
end
