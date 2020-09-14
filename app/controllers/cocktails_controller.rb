class CocktailsController < ApplicationController

    def index
        @cocktails = Cocktail.all
    end
      
    def list
        if logged_in?
            @my_cocktails = current_user.cocktails
        else
            @error = "Please Sign Up to see your cocktails!"
            redirect_to cocktails_path
        end
    end

    def show
        @cocktail = Cocktail.find_by_id(params[:id])
        redirect_to cocktails_path if !@cocktail
    end

    def new
        if logged_in? 
            @cocktail = current_user.cocktails.new
            5.times do
                @cocktail.cocktail_ingredients.build
                @cocktail.cocktail_ingredients.last.build_ingredient
            end
        else
            flash[:message] = "You need an account to create a cocktail!"
            @error = "You need an account to create a cocktail!"
            redirect_to cocktails_path
        end
    end
      
    def create
        @cocktail = current_user.cocktails.new(cocktail_params)
        prepare_cocktail
        if @cocktail.save
            flash[:message] = "Cocktail Has Been Cteated Sucessfully!"
            redirect_to cocktail_path(@cocktail)
        else
            render 'new'
        end
    end
      
    def edit
        @cocktail = Cocktail.find_by_id(params[:id])
        if !@cocktail || @cocktail.user != current_user				
            flash[:message]= "You can't edit this cocktail!"
            redirect_to cocktails_path
        end			
    end
      
    def update
        @cocktail = Cocktail.find_by_id(params[:id])
        if !@cocktail || @cocktail.user != current_user				
            flash[:message]= "You can't edit this cocktail!"
            redirect_to cocktails_path
        else
            @cocktail.attributes = cocktail_params
            prepare_cocktail
            if @cocktail.save
                redirect_to cocktail_path(@cocktail)
                flash[:message] = "Cocktail Has Been Updated Sucessfully!"
            else
                render 'edit'
            end
        end
    end
      
    def destroy
        @cocktail = Cocktail.find_by_id(params[:id])
        if !@cocktail || @cocktail.user != current_user				
            flash[:message]= "You can't delete this cocktail!"
            redirect_to cocktails_path
        else
            @cocktail.destroy
            flash[:message] = "Cocktail Has Been Deleted Succesfully!"
            redirect_to cocktails_path
        end
    end
      
    private

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
      