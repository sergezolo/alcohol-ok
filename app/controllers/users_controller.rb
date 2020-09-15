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
            flash[:message] = "Something went wrong!"
            render :new
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end