class User < ApplicationRecord
    has_many :cocktails
    #has_many :ingredients
    has_secure_password 



    accepts_nested_attributes_for :cocktails




end
