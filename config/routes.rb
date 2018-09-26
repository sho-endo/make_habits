Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "/rules/:make_id/1", to: "rules#make1"
  get "/rules/:make_id/2", to: "rules#make2"
  post "/rules/:make_id/create", to: "rules#make_create"
  get "/rules/:make_id/3", to: "rules#make3"
  get "/rules/:make_id/4", to: "rules#make4"
  
  resources :makes, only: [:new, :create, :show]
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users, only: [:new, :create, :show]
  get "/signup", to: "users#new"
end
