class CocktailsController < ApplicationController

  
    def new
        @cocktail = Cocktail.new
        5.times do
            @cocktail.ingredients.build
            @cocktail.cocktail_ingredients.build
            @cocktail.steps.build  
        end
    end

    def create 
        binding.pry
        #@cocktail.create(cocktail_params)
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

    private

    def cocktail_params
        params.require(:cocktail).permit(
            :name,
            :description,
            ingredient_ids: [],
            cocktail_ingredient_ids: [],
            ingredients: [:name],
            cocktail_ingredients: [:ingredient_id, :quantity, :unit],
            steps:[]
        )
    end

end