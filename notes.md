alcoholOK

User
- has_many :ingredients
- has_many :cocktails
- has_many :comments through :cocktails
* name
* date of birth 
* email
* password


Ingredient
- belongs_to :user
- belongs_to :cocktail
* name

Cocktail
- belongs_to :user
- has_many :ingredients
- has_many :comments
* description
* ingredients
* steps

Comment
- belongs_to :user
- belongs_to :cocktail
* content 

cocktail = {
    name:
    description:
    ingredients: [:ingredient_id, :ingredient_name]
    cocktail_ingredients: [:ingredient_id, :quantity, :unit]
    steps: []
}