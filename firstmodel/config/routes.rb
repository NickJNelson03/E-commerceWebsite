Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  root "products#index"

  get "/products", to: "products#index"

  get "/brands", to: "brands#index"
  # Defines the root path route ("/")
  # root "posts#index"
  devise_scope :user do 
    get "/users/sign_out", to: "devise/sessions#destroy"
    get "/users/info", to: "users#show"
  end
  resources :brands do
    resources :products
  end

  resources :products do
    resources :reviews
  end

  # Cart Routes
  resources :cart_items, only: [:create, :update, :destroy]
  resources :carts, only: [:show, :edit, :update, :destroy]

  
end
