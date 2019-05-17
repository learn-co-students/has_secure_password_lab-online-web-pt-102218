class UsersController < ApplicationController 
    def new 
    end 

    def create 
        #binding.pry
        if params[:user][:password] == nil || params[:user][:password].empty?
            redirect_to '/users/new'
        elsif !params[:user][:password_confirmation].empty? && params[:user][:password] != params[:user][:password_confirmation] 
            redirect_to '/users/new'
        elsif !params[:user][:password_confirmation].empty? && params[:user][:password] == params[:user][:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id
        else
            @user = User.create(user_params)
            session[:user_id] = @user.id
        end
    end  

    def home_page 
        @user = User.find_by(id: session[:user_id])

    end

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end