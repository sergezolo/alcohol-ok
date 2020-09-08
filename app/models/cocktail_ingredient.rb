class CocktailIngredient < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient 
    accepts_nested_attributes_for :ingredient, allow_destroy: true
   
    UNITS = ["", "dash", "bar spoon", "teaspoon", "tablespoon", "pony", "jigger", "cup", "oz.", "ml"]
    
    def ingredient_attributes=(ingredient_attributes)
        binding.pry
        self.ingredient = Ingredient.where(:id => ingredient_attributes[:id]).first_or_create do |i|
            i.name = ingredient_attributes[:name]
        end
    end



    
end
