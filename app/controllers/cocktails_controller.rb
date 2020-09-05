class CocktailsController < ApplicationController

  
    def new
        @cocktail = Cocktail.new
        @cocktail.steps.build 
        @cocktail.ingredients.build
        @cocktail.cocktail_ingredients.build
    end

    def create 
        #binding.pry
        @cocktail = Cocktail.create(cocktail_params)
        
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
            steps_attributes:[:step],
            ingredients_attributes: [   :ingredient_id, 
                                        :name,
                                        cocktail_ingredients: [:quantity, :unit]
                                    ]
            
        )
    end

end