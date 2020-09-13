class User < ApplicationRecord
    has_many :cocktails
    accepts_nested_attributes_for :cocktails, allow_destroy: true
    has_secure_password 
    

end
