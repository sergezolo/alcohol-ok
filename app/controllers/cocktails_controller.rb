class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [:show, :new, :edit, :update, :destroy]

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @cocktails = @user.cocktails
        else
            @error = "User doesn't exist" if params[:user_id]
            @cocktails = Cocktail.all
        end
        @cocktails = @cocktails.search(params[:name]) if params[:name] && !params[:name].empty?
    end

    def sorted_abc(var)
        @cocktails = Cocktail.all.sorted_abc
        render :index
    end

    def sorted_zyx
        @cocktails = Cocktail.all.sorted_zyx
        render :index
    end
      
    def show
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
        if !@cocktail || @cocktail.user != current_user				
            flash[:message]= "You can't edit this cocktail!"
            redirect_to cocktails_path
        end			
    end
      
    def update
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

    def find_cocktail
        @cocktail = Cocktail.find_by_id(params[:id])
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
        #binding.pry 
        @cocktail.cocktail_ingredients.each do |cocktail_ingredient|
            if ingredient = Ingredient.where('LOWER(name) = ?', cocktail_ingredient.ingredient.name.downcase).first
                cocktail_ingredient.ingredient_id = cocktail_ingredient.ingredient.id = ingredient.id
            end
        end
    end

end
      