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
  get "/mycocktails" => "users#show"
  resources :users
  resources :cocktails do
    # All Cocktails
    get "/cocktails" => "cocktails#index"
  end

  resources :cocktails do
    resources :ingredients
  end




end
