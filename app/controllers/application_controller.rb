class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    private
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if logged_in?
    end

    def redirect_if_not_logged_in
        redirect_to cocktails_path if !logged_in?
    end
end