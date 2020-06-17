class Follower < ApplicationRecord
    has_many :favorites
    has_many :dogs, through: :favorites


    def get_dogs
        dog_ids = dog = self.favorites.map do |fav|
            fav.dog_id
        end 
        @dogs = dog_ids.map do |id|
            Dog.find(id) 
        end 
        @dogs
    end 
end
