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

  resources :users, except: :create do
    resources :pictures, :except => [:update, :destroy]
  end

  resources :pictures, :only => [:update, :destroy]

  resources :frames
  resources :walls
  # get "pictures/image" => "pictures#image"


  get "/search" => "search#index", :as => "search"

  post "share_picture/:id" => "shares#share_picture", :as => "share_picture"
  delete "unshare_picture/:id" => "shares#delete_share", :as => "unshare_picture"


end
