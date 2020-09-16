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
  #Facebook SignIn
  get '/auth/facebook/callback' => 'sessions#oauth_login'
  resources :users
  resources :cocktails do
    collection do
      get :sorted_abc
      get :sorted_zyx
    end
    get "/ingredient" => "cocktail_ingredients#new"
    post "/ingredient" => "cocktail_ingredients#create"
    delete "/ingredient" => "cocktail_ingredients#destroy"
  end
end
