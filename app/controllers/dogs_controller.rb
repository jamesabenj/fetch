class DogsController < ApplicationController
    before_action :require_login, except: [:index, :global_index, :show]
    layout :dogs_layout
    def new
        @dog = Dog.new
        @breed = Breed.new
    end 

    def index
       @user = User.find(params[:user_id])
       @dogs = @user.dogs
       if !@dogs.any?
        @notice = "This user doesn't have any available dogs."
       end 
    end 

    def global_index
        @dogs = Dog.search(params[:search])
        if params[:search] && !Breed.find_by(name: params[:search])
            @error = "No dogs match that breed, showing all dogs"
        end 
    end 

    def create
        @dog = Dog.new(dog_params)
        breed = Breed.find_or_create_by(breed_params)
        @dog.breed = breed
        current_user.dogs << @dog
        if @dog.save
            redirect_to user_dog_path(current_user, @dog)
        else 
            render :new
        end
    end 

    def show
        find_dog
    end 

    def edit
        find_dog
    end 

    def update
        find_dog
        if @dog.user == current_user
            @dog.update(dog_params)
            if @dog.valid?
                redirect_to user_dog_path(current_user, @dog)
            else 
                render :edit
            end
        else 
            redirect_to profile_path(current_user)
        end 
    end 

    def destroy
        find_dog
        @dog.destroy
        redirect_to user_dogs_path
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :bio, :adopted, {images: []})
    end 

    def breed_params
        params.require(:breed).permit(:name)
    end 
end
