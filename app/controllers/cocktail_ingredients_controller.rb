class CocktailIngredientsController < ApplicationController

    def new
      if params[:cocktail_id] && @cocktail = current_user.cocktails.find_by_id(params[:cocktail_id])
        @cocktail_ingredient = @cocktail.cocktail_ingredients.build
        @cocktail_ingredient.build_ingredient
      else
        flash[:message] = "You can't edit this cocktail!"
        redirect_to cocktails_path
      end
    end

    def create
      @cocktail = current_user.cocktails.find_by_id(params[:cocktail_id])
      @ingredient = Ingredient.find_or_create_by(name: params[:cocktail_ingredient][:ingredient_attributes][:name])
      if @ingredient.name != ""
        @cocktail_ingredient = @cocktail.cocktail_ingredients.new(cocktail_ingredients_params)
        @cocktail_ingredient.ingredient_id = @ingredient.id
        if @cocktail_ingredient.save
          flash[:message] = "Ingredient Has Been Added Sucessfully!"
          redirect_to cocktail_path(@cocktail)
        else
          render 'new'
        end
      else
        flash[:message] = "Add ingredient name!"
        render 'new'
      end
    end

    def destroy
        if params[:cocktail_id] && @cocktail = current_user.cocktails.find_by_id(params[:cocktail_id])
          @cocktail_ingredient = CocktailIngredient.find_by_id(params[:id])
          if !@cocktail_ingredient 		
              flash[:message]= "You can't delete this ingredient!"
              redirect_to cocktail_path(@cocktail)
          else
              @cocktail_ingredient.destroy
              flash[:message] = "Ingredient Has Been Deleted Succesfully!"
              redirect_to cocktail_path(@cocktail)
          end
        end
    end

    private

    def cocktail_ingredients_params
      params.require(:cocktail_ingredient).permit(:cocktail_id, :quantity, :unit)
    end

end
