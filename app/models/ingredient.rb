class Ingredient < ApplicationRecord
    has_many :cocktail_inredients
    has_many :cocktails through: :cocktail_ingredients
end
