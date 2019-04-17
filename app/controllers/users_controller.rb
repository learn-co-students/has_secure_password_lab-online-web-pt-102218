class UsersController < ApplicationController

    def index
    end

    def new
    end

    def create
        user = User.create(name: params[:user][:name], password: params[:user][:password])
        if user.password == params[:user][:password_confirmation]
            session[:user_id] = user.id 
        end
        redirect_to '/users/new'
    end


end
