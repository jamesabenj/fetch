  
class UsersController < ApplicationController

    before_action :require_login, except: [:new, :create, :home]
  
    def home
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password_digest)
    end
  
  end