class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

    def index
        @cocktails = Cocktail.all
    end

    def home
        if params[:user_id]
            @cocktails = User.find(params[:user_id]).cocktails
        else
            @cocktails = Cocktail.all
        end
    end
      
    def new
        @cocktail = Cocktail.new(user_id: params[:user_id])
        5.times {@cocktail.cocktail_ingredients.build.build_ingredient}
    end
      
    def create
        binding.pry
        @cocktail = current_user.cocktails.build(cocktail_params)
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
        if !authorized_to_edit?(@cocktail)
            redirect to cocktails_path
            flash[:alert]= "You Don't Have The Access To This Cocktail!"
        end
        if @cocktail.update(cocktail_params)
            redirect_to cocktail_path(@cocktail)
            flash[:success] = "Cocktail Has Been Updated Sucessfully!"
        else
            render 'edit'
        end
    end
      
    def destroy
        @cocktail.destroy
        redirect_to root_path
        flash[:success] = "Cocktail Has Been Deleted Succesfully!"
    end
      
    private
      
    def find_cocktail
        @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
        params.require(:cocktail).permit(
            :name,
            :story,
            :instruction,
            cocktail_ingredients_attributes: [
                :id,
                :ingredient_id,
                :recipe_id,
                :quantity,
                :unit,
                ingredient_attributes: [:id, :name]
            ]
        )
    end

end
      