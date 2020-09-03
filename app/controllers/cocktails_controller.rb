class CocktailsController < ApplicationController

  
    def new
        @cocktail = Cocktail.new
    end

    def index
        if params[:user_id]
            user = User.find_by_id(params[:user_id])
            if user.nil?
                redirect_to cocktails_path
            else
                @coctails = user.coctails
            end
        else
            @cocktails = Cocktail.all
        end
    end

    def show
        @cocktail = Cocktail.find(params[:id])
    end

end