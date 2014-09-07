Rails.application.routes.draw do
  get "sign_up/:source" => "users#new", :as => "sign_up"
  post "sign_up" => "users#create_guest", :as => "create_guest"
  get "sign_in" => "sessions#new", :as => "sign_in"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#delete"
  post "/users/:source" => "users#create"
  post "/users" => "users#create"
  get "hang_it/:id" => "walls#index", :as => "hang_it"

  root to: "home#index"
  resources :users, except: :create
  get "pictures/image" => "pictures#image"
  resources :pictures
  resources :frames
  resources :walls

end
