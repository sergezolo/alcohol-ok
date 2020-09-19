class User < ApplicationRecord
    has_secure_password 
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    has_many :cocktails
    has_many :cocktail_ingredients, through: :cocktails
    accepts_nested_attributes_for :cocktails, allow_destroy: true
end