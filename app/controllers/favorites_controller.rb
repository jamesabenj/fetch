class FavoritesController < ApplicationController
    layout 'user'
    def create
        #byebug
        fav = Favorite.new
        find_dog
        follower = Follower.find_or_create_by(id: current_user.id)
        @dog.favorites << fav
        follower.favorites << fav 
        fav.save
        redirect_to user_dog_path(@dog.user.id, @dog)
    end 

    def index
        follower = Follower.find_by(id: current_user.id)
        if follower
            @dogs = follower.get_dogs
        end 
        if !follower || !@dogs.any?
            @notice = "You don't have any favorites."
        end
    end 
end 