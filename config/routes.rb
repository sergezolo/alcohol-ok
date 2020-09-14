Rails.application.routes.draw do
  resources :steps
  # Sign Out
  delete "/signout" => "sessions#destroy"
  # First Page
  root "sessions#welcome"
  # Younger than 21
  get "/bye" => "sessions#bye"
  # Sign Up
  get "/signup" => "users#new"
  # Sign In
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  # All User's Cocktails 
  get "/mycocktails" => "cocktails#list"
  resources :users
  resources :cocktails 
end
