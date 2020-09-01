Rails.application.routes.draw do
  resources :users do
    resources :cocktails
  end
  resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
