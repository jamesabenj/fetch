  
class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :home]
    layout :dogs_layout
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to profile_path(@user)
      else
        render :new
      end
    end
    
    def profile
      find_user
    end 

    def show 
      find_user
    end 
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
  
  end