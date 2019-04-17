class UsersController < ApplicationController
  #before_action :require_login 
  #skip_before_action :require_login, only: [:show]
  def index
  end

  def show 
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
