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
