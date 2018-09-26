Rails.application.routes.draw do
  root to: "toppages#index"
  
  resources :makes, only: [:new, :create, :show]
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users, only: [:new, :create, :show]
  get "/signup", to: "users#new"
end
