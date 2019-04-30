class UsersController < ApplicationController
    def new 
    end 

    def create 
       
        @user = User.create(users_params)
       
        if @user && @user.authenticate(params[:user][:password]) && @user.password_confirmation == @user.password 
            session[:user_id] = @user.id
        else 
            redirect_to new_user_path 
        end
    end 


    private 

    def users_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end
