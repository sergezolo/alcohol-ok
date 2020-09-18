class Cocktail < ApplicationRecord
    before_save {self.name.upcase!}
    validates :name, :instructions, presence: true
    belongs_to :user
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients
    accepts_nested_attributes_for :cocktail_ingredients, allow_destroy: true

    scope :sorted_abc, -> { order('name') }
    scope :sorted_zyx, -> { order('name DESC') }
    scope :by_ingredient, -> (i){ joins(:ingredients).where("ingredients.name = ?", i) }

    def self.search(name)
        where(['name LIKE ?', "%#{name}%"])
    end

end

    
