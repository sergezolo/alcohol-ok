class User < ApplicationRecord
    has_secure_password 
    validates_presence_of :name, message: "can't be blank"
    validates_uniqueness_of :email, on: :create, message: "must be unique"
    has_many :cocktails
    accepts_nested_attributes_for :cocktails, allow_destroy: true
end

