class CocktailIngredient < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient 

    UNITS = ["", "dash", "bar spoon", "teaspoon", "tablespoon", "pony", "jigger", "cup", "oz.", "ml"]
    


    
end
