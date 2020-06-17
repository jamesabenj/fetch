class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end 

  def find_dog
    @dog = Dog.find(params[:id])
  end 

  def require_login
    if current_user
      current_user
    else
        redirect_to '/'
    end
  end

  def dogs_layout
    current_user ? "user" : "general" 
  end 
end

