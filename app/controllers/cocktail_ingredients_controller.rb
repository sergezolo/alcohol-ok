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
      @ingredient = Ingredient.find_or_create_by(name: params[:cocktail_ingredient][:ingredient][:name])
      @cocktail_ingredient = @cocktail.cocktail_ingredients.new(cocktail_ingredients_params)
      @cocktail_ingredient.ingredient_id = @ingredient.id
      if @cocktail_ingredient.save
        flash[:message] = "Ingredient Has Been Added Sucessfully!"
        redirect_to cocktail_path(@cocktail)
      else
        render 'new'
      end
    end

    def destroy
        if params[:cocktail_id] && @cocktail = current_user.cocktails.find_by_id(params[:cocktail_id])
          @cocktail_ingredient = CocktailIngredient.find_by_id(params[:format])
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

    def cocktail_ingredient_params
        params.require(:cocktail_ingredient).permit(
            :cocktail_id,
            :quantity,
            :unit,
            :ingredient => [
                #:id,
                :name
            ]
        )
    end

    def cocktail_ingredients_params
      params.require(:cocktail_ingredient).permit(:cocktail_id, :quantity, :unit)
    end

    def find_ingredient
      if ingredient = Ingredient.where('LOWER(name) = ?', cocktail_ingredient.ingredient.name.downcase).first
        cocktail_ingredient.ingredient_id = cocktail_ingredient.ingredient.id = ingredient.id
      end
    end

end
