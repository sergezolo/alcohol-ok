class SessionsController < ApplicationController

    def welcome
    end

    def bye        
    end

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:message] = "Incorrect email or password, please try again!"
            redirect_to signin_path
        end
    end
    
    def destroy
        session.clear
        redirect_to cocktails_path
    end
    
end
