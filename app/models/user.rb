class User < ApplicationRecord
    has_many :cocktails
    accepts_nested_attributes_for :cocktails
    has_secure_password 
    

end
