class SessionsController < ApplicationController 
    def new 
    end 

    def create
        #binding.pry
        if params[:user][:name] == nil || params[:user][:name].empty? 
            render :new
        else
            #binding.pry
            @user = User.find_by(name: params[:user][:name])
            #redirect_to home_page_path 
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
            else 
                redirect_to home_page_path 
            end
        end

    end
end