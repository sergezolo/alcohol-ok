class CocktailIngredient < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient 
    accepts_nested_attributes_for :ingredient, 
                                        reject_if: proc { |att| att['name'].blank? },
                                        :allow_destroy => true
    
   
    UNITS = ["", "dash", "bar spoon", "teaspoon", "tablespoon", "pony", "jigger", "cup", "oz.", "ml"]

    # def ingredient_name
    #     self.ingredient.name if self.id.nil?
    # end
    
    # def ingredient_name=(name)
    #     @ingredient = Ingredient.find_or_create_by(name: name.downcase)
    #     self.ingredient_id = @ingredient.id
    # end

end
