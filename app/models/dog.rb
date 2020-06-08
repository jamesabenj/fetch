class Dog < ApplicationRecord
    validates :name, presence: true
    validates :bio, presence: true 
    validates :breed, presence: true 
end
