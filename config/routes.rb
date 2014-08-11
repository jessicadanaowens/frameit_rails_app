Rails.application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  post "sign_up" => "users#create_guest", :as => "create_guest"
  get "sign_in" => "sessions#new", :as => "sign_in"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#delete"

  # root :to => "users#new"
  root to: 'pictures#index'
  resources :users
  resources :pictures


end
