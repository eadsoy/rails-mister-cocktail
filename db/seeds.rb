# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

if Rails.env.development?
  puts 'Cleaning doses...'
  Dose.destroy_all
  puts 'Cleaning cocktails...'
  Cocktail.destroy_all
  puts 'Cleaning ingredients...'
  Ingredient.destroy_all
  puts 'Cleaning reviews...'
  Review.destroy_all
end

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
dict = open(url).read

the_cocktail_db = JSON.parse(dict)
ingredients = the_cocktail_db.values.flatten

ingredients.each do |name|
  Ingredient.create(
    name: name.values.first
  )
end

# ------cocktails-------
aperol = Cocktail.create!(
  name: 'Aperol Spritz'
)

mojito = Cocktail.create!(
  name: 'Mojito'
)



# ------photos-------


aperol.photo.attach(
  io: open('../assets/images/aperolspritz.jpg'),
  filename: 'aperol.jpg'
)

mojito.photo.attach(
  io: open('../assets/images/mojito.jpg'),
  filename: 'mojito.jpg'
)


# ---------doses--------
# Aperol Spritz
# 3 ounces prosecco
# 2 ounces Aperol
# 1 ounce soda water
# Garnish: orange wheel
puts "adding ingredients to aperol spritz"

Dose.create!(
  description: '3 ounces',
  cocktail: aperol,
  ingredient: Ingredient.new(name: "Prosecco")
)

Dose.create!(
  description: '2 ounces',
  cocktail: aperol,
  ingredient: Ingredient.new(name: "Aperol")
  )

Dose.create!(
  description: '1 ounce',
  cocktail: aperol,
  ingredient: Ingredient.new(name: "soda water")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: aperol,
  ingredient: Ingredient.new(name: "orange wheel")
)

# Mojito
# 10 leaf (blank)s fresh mint leaves
# ½ lime, cut into 4 wedges
# 2 tablespoons white sugar, or to taste
# 1 cup ice cubes
# 1 ½ fluid ounces white rum
# ½ cup club soda

puts "adding ingredients to mojito"

Dose.create!(
  description: '10 leaf (blank)s',
  cocktail: mojito,
  ingredient: Ingredient.new(name: "fresh mint leaves")
)

Dose.create!(
  description: '1/2 ',
  cocktail: mojito,
  ingredient: Ingredient.new(name: "lime, cut into 4 wedges")
  )

Dose.create!(
  description: '2 tablespoons',
  cocktail: mojito,
  ingredient: Ingredient.new(name: "white sugar")
)

Dose.create!(
  description: '1 cup ',
  cocktail: mojito,
  ingredient: Ingredient.new(name: "ice cubes")
)

Dose.create!(
  description: '1/2 fluid ounces ',
  cocktail: mojito,
  ingredient: Ingredient.new(name: "white rum")
)

Dose.create!(
  description: '1/2 cup ',
  cocktail: mojito,
  ingredient: Ingredient.new(name: "club soda")
)

