class Cocktail < ApplicationRecord
    belongs_to :user
    has_many :steps
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients
    accepts_nested_attributes_for :steps
    accepts_nested_attributes_for :ingredients
    accepts_nested_attributes_for :cocktail_ingredients
    

end