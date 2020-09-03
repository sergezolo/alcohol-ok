Rails.application.routes.draw do
  # First Page
  root "sessions#welcome"
  # Younger than 21
  get "/bye" => "sessions#bye"
  # Sign Up
  get "/signup" => "users#new"
  # Sign In
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  # Sign Out
  delete "/signout" => "sessions#destroy"

 
  resources :users
  resources :cocktails


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
