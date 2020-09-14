class CocktailIngredientsController < ApplicationController

    def new
        if params[:cocktail_id] && @cocktail = Cocktail.find_by(params[:cocktail_id])
            @cocktail_ingredient = @cocktail.cocktail_ingredients.build
            @cocktail_ingredient.build_ingredient
        else
            flash[:message] = "You can't edit this cocktail!"
            @error = "You can't edit this cocktail!"
            redirect_to cocktail_path(@cocktail)
        end
    end
      
    def create

        @cocktail = current_user.cocktails.find_by_id(params[:id])
        @cocktail_ingredient = @cocktail.cocktail_ingredients.build(cocktail_ingredient_params)
        @cocktail_ingredient.ingredient.build
        if @cocktail_ingredient.save
            flash[:message] = "Cocktail Has Been Updated Sucessfully!"
            redirect_to cocktail_path(@cocktail)
        else
            render 'new'
        end
    end

    def destroy
        binding.pry
        @cocktail = Cocktail.find_by_id(params[:cocktail_id])
        @cocktail_ingredient = @cocktail.cocktail_ingredients.find_by_id(params[:id])
        if !@cocktail_ingredient 		
            flash[:message]= "You can't delete this ingredient!"
            redirect_to cocktail_path(@cocktail)
        else
            @cocktail_ingredient.destroy
            flash[:message] = "Ingredient Has Been Deleted Succesfully!"
            redirect_to cocktail_path(@cocktail)
        end
    end

    private

    def cocktail_ingredient_params
        params.require(:cocktail_ingredien).permit(
            :cocktail_id,
            :quantity,
            :unit,
            :ingredient_attributes => [
                #:id,
                :name
            ]
        )
    end
end
