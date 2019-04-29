class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    unless user.valid?
      return redirect_to new_user_path 
    else
      session[:user_id] = user.id
    end
    

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
