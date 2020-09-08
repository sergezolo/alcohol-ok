Rails.application.routes.draw do
  resources :steps
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
  # All User's Cocktails 
  get "/mycocktails" => "users#show"

 
  resources :users

  resources :cocktails do
    # All Cocktails
    get "/cocktails" => "cocktails#index"

  end

  resources :cocktails, only: [:show] do
    resources :ingredients
  end

  resources :cocktails


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
