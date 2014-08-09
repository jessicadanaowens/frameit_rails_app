Rails.application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  get "sign_in" => "sessions#new", :as => "sign_in"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#delete"
  root :to => "users#new"
  resources :users


end
