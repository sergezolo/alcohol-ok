# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredients = ["agave syrup", "almond (orgeat) syrup", "amaretto liqueur", "angostura aromatic bitters", "anise liqueur", "apple juice", "apple schnapps liquor", "apricot brandy liqueur", "basil leaves", "Benedictine DOM liqueur", "black pepper", "black raspberry liqueur", "blended scotch whisky", "blue curacao liqueur", "bourbon whiskey", "cachca", "calvados apple brandy", "campari bitter", "champagne brut", "chartreuse jaune", "chartreuse vert", "cherry brandy liqueur", "coconut rum liqueur", "coffee liqueur", "cognac VSOP", "cranberry juice", "cream", "creme de banane liqueur", "creme de cassis", "creme de framboise liqueur", "dark creme de cacao liqueur", "drambuie liqueur", "dubonnet red", "egg white", "elderflower liqueur", "espresso coffee", "falernum liqueur", "fino sherry", "galliano l’autentico liqueur", "gin dry", "ginger", "ginger ale", "ginger beer", "ginger liqueur", "grand marnier liqueur", "grapefruit juice", "hazelnut liqueur", "honey", "honey syrup", "irish cream liqueur", "islay single malt scotch whiskey", "jenever", "lemon juice", "lemonade/sprite/7up", "lillet blanc", "lime cordial", "lime juice", "maple syrup", "maraschino liqueur", "melon liqueur", "milk", "mint leaves/springs", "navy rum", "orange bitters", "orange juice", "passion fruit", "passion fruit syrup", "peach schnapps liqueur", "peychaud’s aromatic bitters", "pineapple juice", "pisco", "pomegranate (grenadine) syrup", "port wine", "raspberries", "rum aged", "rum golden", "rum overproof", "rum white", "sake", "soda (club soda)", "southern comfort liquor", "sparkling wine (prosecco) ", "straight rye whiskey", "strawberries", "sugar (simple) syrup", "sugar vanilla syrup", "tequila (reposado) ", "tonic water", "triple sec liqueur", "vermouth dry", "vermouth sweet", "vodka", "vodka (citrus flavored)", "vodka (raspberry flavored)", "vodka (vanilla infused)", "white creme de cacao liqueur", "white creme de menthe", "white wine (sauvignon blanc)", "zubrowka bison grass vodka"]

ingredients.each do |ingredient|
    Ingredient.create(name: ingredient)
end

user1 = User.create(name: "Donald T", email: "donald@whitehouse.gov", password_digest: BCrypt::Password.create('123456'))
user2 = User.create(name: "Vlad P", email: "vladimir@kremlin.ru", password_digest: BCrypt::Password.create('123456'))

# qr_params => {name: "Quill Riff", user_id: user1.id,
#       description: "Keith Meicher, the head bartender at Sepia in Chicago, finds that blanc vermouth has a great affinity for absinthe. This white variation on a Quill, essentially an absinthe-tinged Negroni, sees sweet red vermouth replaced with white, and Campari with Luxardo Bitter Bianco. It’s a great beginner cocktail for the absinthe-curious since it contains just a small amount of the green spirit to coat the glass, adding subtle scent and flavor. 'Some people might be turned off of absinthe because they fear it’s too dominant a flavor,' says Meicher. 'But with a deft hand, you can balance any cocktail.'",
#       instructions: "Rinse a rocks glass with absinthe and discard excess. Add all ingredients into a mixing glass with ice and stir until well-chilled. Strain into the prepared rocks glass over a fresh large ice cube. Garnish with a grapefruit twist.",
#       :cocktail_ingredients_attributes => {
#           "0" => {
#             quantity: "11/2",
#             unit: "oz.",
#             :ingredient_attributes => {
#                 name: "gin dry"
#             }
#           },
#           "1" => {
#             quantity: "1",
#             unit: "oz.",
#             :ingredient_attributes => {
#                 name: "vermouth Dolin blanc"
#             }
#           },
#           "2" => {
#             quantity: "3/4",
#             unit: "oz.",
#             :ingredient_attributes => {
#                 name: "Luxardo Bitter Bianco"
#             }
#           },
#           "3" => {
#             quantity: "",
#             unit: " ",
#             :ingredient_attributes => {
#                 name: "Absinthe, to rinse glass"
#             }
#           },
#           "4" => {
#             quantity: "",
#             unit: " ",
#             :ingredient_attributes => {
#                 name: "Garnish: grapefruit twist"
#             }
#           }
#       }
#     }

#     #qr_params = ("name"=>"Quill Riff", "description"=>"Keith Meicher, the head bartender at Sepia in Chicago, finds that blanc vermouth has a great affinity for absinthe. This white variation on a Quill, essentially an absinthe-tinged Negroni, sees sweet red vermouth replaced with white, and Campari with Luxardo Bitter Bianco. It’s a great beginner cocktail for the absinthe-curious since it contains just a small amount of the green spirit to coat the glass, adding subtle scent and flavor. 'Some people might be turned off of absinthe because they fear it’s too dominant a flavor,' says Meicher. 'But with a deft hand, you can balance any cocktail.'", "instructions"=>"Rinse a rocks glass with absinthe and discard excess. Add all ingredients into a mixing glass with ice and stir until well-chilled. Strain into the prepared rocks glass over a fresh large ice cube. Garnish with a grapefruit twist.", "cocktail_ingredients_attributes"=> {"0"=> {"quantity"=>"1/2", "unit"=>"oz.", "ingredient_attributes"=> {"name"=>"gin dry"}}, "1"=> {"quantity"=>"1", "unit"=>"oz.", "ingredient_attributes"=> {"name"=>"vermouth Dolin blanc"}}, "2"=> {"quantity"=>"3/4", "unit"=>"oz.", "ingredient_attributes"=> {"name"=>"vermouth Dolin blanc"}}, "3"=> {"quantity"=>"", "unit"=>"", "ingredient_attributes"=> {"name"=>"Absinthe, to rinse glass"}}, "4"=> {"quantity"=>"", "unit"=>"", "ingredient_attributes"=> {"name"=>"Garnish: grapefruit twist"}}})
#     create(qr, qr_params)


#     private

#     def create(i, i_params)
#         i = Cocktail.new(i_params)
#             i.cocktail_ingredients.each do |cocktail_ingredient|
#                 if ingredient = Ingredient.where('LOWER(name) = ?', cocktail_ingredient.ingredient.name.downcase).first
#                     cocktail_ingredient.ingredient_id = cocktail_ingredient.ingredient.id = ingredient.id
#                 end
#             end
#         i.save
#     end