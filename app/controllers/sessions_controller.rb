class SessionsController < ApplicationController

    def welcome
        render layout: false
    end

    def bye
        render layout: false
    end

    def new
    end

    def oauth_login
        user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end
        session[:user_id] = user.id
        redirect_to cocktails_path
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

    private

    def auth
        request.env['omniauth.auth']
    end
    
end
