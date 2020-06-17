
class SessionsController < ApplicationController
    layout :dogs_layout

    def home 
      if current_user
        redirect_to profile_path(current_user)
      end 
    end 

    def authcreate
      data = auth.info
      @user = User.find_or_create_by(username: data['email'])
      if !@user.password
        @user.password = SecureRandom.hex
      end
      @user.save
      session[:user_id] = @user.id
      #byebug
      redirect_to profile_path(@user)
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to profile_path(@user)
      else
          @error = "Invalid credentials."
          render :new
      end
    end
  
    def destroy
      session.clear
      redirect_to '/'
    end


    private 

    def auth
      request.env["omniauth.auth"]
    end
  
  end