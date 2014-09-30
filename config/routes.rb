Rails.application.routes.draw do
  get "sign_up/:source" => "users#new", :as => "sign_up"
  post "sign_up" => "users#create_guest", :as => "create_guest"
  get "sign_in" => "sessions#new", :as => "sign_in"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#delete"
  post "/users/:source" => "users#create"
  post "/users" => "users#create"
  get "walls/:id" => "walls#index"
  get "hang_it" => "hang_it#index"

  root to: "home#index"

  resources :users, except: :create do
    resources :pictures, :except => [:update, :destroy]
  end

  resources :pictures, :only => [:update, :destroy]

  resources :frames
  resources :walls

  get "/search" => "search#index", :as => "search"

  post "share_picture/:id" => "shares#share_picture", :as => "share_picture"
  delete "unshare_picture/:id" => "shares#delete_share", :as => "unshare_picture"

end
