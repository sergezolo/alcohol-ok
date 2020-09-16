class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Account created successfully!"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = @user.errors
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        if @user.id != current_user.id
            flash[:message] = "You are not authorized to access that profile"
            redirect_to cocktails_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end