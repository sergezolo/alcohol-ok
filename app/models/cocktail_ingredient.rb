class CocktailIngredient < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient 
    accepts_nested_attributes_for :ingredient, allow_destroy: true
   
    UNITS = ["", "dash", "bar spoon", "teaspoon", "tablespoon", "pony", "jigger", "cup", "oz.", "ml"]
    


    
end
