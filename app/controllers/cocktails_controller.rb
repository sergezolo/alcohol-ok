class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

    def index
        @cocktails = Cocktail.all
    end
      
    def new
        @cocktail = Cocktail.new
        5.times do
            @cocktail.cocktail_ingredients.build
            @cocktail.cocktail_ingredients.last.build_ingredient
        end
    end
      
    def create
        @cocktail = current_user.cocktails.new(cocktail_params)
        prepare_cocktail
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
            flash[:success] = "Cocktail Has Been Cteated Sucessfully!"
        else
            render 'new'
        end
    end
      
    def edit
        if !authorized_to_edit?(@cocktail)
            redirect_to cocktails_path
            flash[:alert]= "You Don't Have The Access To This Cocktail!"
        end
    end
      
    def update
        @cocktail.attributes = cocktail_params
        prepare_cocktail
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
            flash[:success] = "CCocktail Has Been Updated Sucessfully!"
        else
            render 'edit'
        end
    end
      
    def destroy
        @cocktail.destroy
        redirect_to cocktails_path
        flash[:success] = "Cocktail Has Been Deleted Succesfully!"
    end
      
    private
      
    def find_cocktail
        @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
        params.require(:cocktail).permit(
            :name,
            :description,
            :instructions,
            :cocktail_ingredients_attributes => [
                :id,
                :quantity,
                :unit,
                :ingredient_attributes => [
                    #:id,
                    :name
                ]
            ]
        )
    end

    def prepare_cocktail
        @cocktail.cocktail_ingredients.each do |cocktail_ingredient|
            if ingredient = Ingredient.where('LOWER(name) = ?', cocktail_ingredient.ingredient.name.downcase).first
                cocktail_ingredient.ingredient_id = cocktail_ingredient.ingredient.id = ingredient.id
            end
        end
    end

end
      