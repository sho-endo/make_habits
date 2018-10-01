Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "/habits/select", to:"habits#select"
  
  get "/makes/:make_id/1", to: "rules#make1"
  get "/makes/:make_id/2", to: "rules#make2"
  post "/makes/:make_id/create", to: "rules#make_create"
  get "/makes/:make_id/3", to: "rules#make3"
  get "/makes/:make_id/4", to: "rules#make4"
  
  get "/quits/:quit_id/1", to: "rules#quit1"
  get "/quits/:quit_id/2", to: "rules#quit2"
  post "/quits/:quit_id/create", to: "rules#quit_create"
  
  resources :quits, only: [:new, :create, :show]
  resources :makes, only: [:new, :create, :show]
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users, only: [:new, :create, :show]
  get "/signup", to: "users#new"
end
