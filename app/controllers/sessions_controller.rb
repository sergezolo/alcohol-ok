class SessionsController < ApplicationController

    def welcome
        render layout: false
    end

    def bye
        render layout: false
    end

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to cocktails_path
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
