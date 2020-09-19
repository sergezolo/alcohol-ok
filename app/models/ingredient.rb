class Ingredient < ApplicationRecord
    before_save {self.name.downcase!}
    validates :name, :uniqueness => {:case_sensitive => false} 
    has_many :cocktail_ingredients
    has_many :cocktails, through: :cocktail_ingredients
end