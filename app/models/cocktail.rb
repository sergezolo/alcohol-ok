class Cocktail < ApplicationRecord
    before_save {self.name.upcase!}
    belongs_to :user
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients
    accepts_nested_attributes_for :cocktail_ingredients, allow_destroy: true
    
    scope :sorted_abc, -> { order('name') }
    scope :sorted_zyx, -> { order('name DESC') }

    def self.by_name(name)
        where(['name LIKE ?', "%#{name}%"])
    end


end

    
