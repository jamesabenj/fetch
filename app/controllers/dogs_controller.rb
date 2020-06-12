class DogsController < ApplicationController

    def new
        @dog = Dog.new
    end 

    def create
        @dog = Dog.new(dog_params)
        if @dog.save
            #byebug
            redirect_to dog_path(@dog)
        else 
            render :new
        end
    end 

    def index
        @dogs = Dog.all
    end 

    def show
        @dog = Dog.find(params[:id])
        #byebug
    end 

    def edit
        @dog = Dog.find(params[:id])
    end 

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        @dog.save
        redirect_to dog_path(@dog)
    end 

    def delete
    end 

    def dog_params
        params.require(:dog).permit(:name, :bio, :adopted, :breed, {images: []})
    end 
end
