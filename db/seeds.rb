# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


puts 'Cleaning doses...'
Dose.destroy_all
puts 'Cleaning cocktails...'
Cocktail.destroy_all
puts 'Cleaning ingredients...'
Ingredient.destroy_all

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
@aperol = Cocktail.create!(
  name: 'Aperol Spritz'
)

@mojito = Cocktail.create!(
  name: 'Mojito'
)

@pina_colada = Cocktail.create!(
  name: 'Pina Colada'
)

@brandy_alexander = Cocktail.create!(
  name: 'Brandy Alexander'
)

@cosmopolitan = Cocktail.create!(
  name: 'Cosmopolitan'
)

@aviation = Cocktail.create!(
  name: 'Aviation'
)

@darknstormy = Cocktail.create!(
  name: "Dark'n Stormy"
)

@vodka_martini = Cocktail.create!(
  name: 'Vodka Martini'
)

@french75 = Cocktail.create!(
  name: 'French 75'
)

@manhattan = Cocktail.create!(
  name: 'Manhattan'
)

@bloodandsand = Cocktail.create!(
  name: 'Blood and Sand'
)

@ramos_gin_fizz = Cocktail.create!(
  name: 'Ramos Gin Fizz'
)

# ------photos-------

@aperol.photo.attach(
  io: URI.open('https://static01.nyt.com/images/2019/05/15/dining/09spritz1/merlin_141351063_e6829ad6-f61c-435a-b6c3-87526a0613ef-superJumbo.jpg'),
  filename: 'aperol.jpg',
  content_type: 'image/jpg'
)

@mojito.photo.attach(
  io: URI.open('https://alushlifemanual.com/wp-content/uploads/2020/04/Captain-Morgan-Mojito-735x551.jpg'),
  filename: 'mojito.jpg',
  content_type: 'image/jpg'
)

@pina_colada.photo.attach(
  io: URI.open('https://www.thespruceeats.com/thmb/nmjmMios25mhZwgncuN1CRDiNCM=/4494x2528/smart/filters:no_upscale()/virgin-pina-colada-recipe-2097115_05-5b0d8124ff1b7800364356ae.jpg'),
  filename: 'pina_colada.jpg',
  content_type: 'image/jpg'
)

@brandy_alexander.photo.attach(
  io: URI.open('https://www.liquor.com/thmb/pWa_cj781FXUeWpph7xvqRbtAW4=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/brandy-alexander-720x720-primary-1413e8a77c274432b32c5f61307b5c01.jpg'),
  filename: 'brandy_alexander.jpg',
  content_type: 'image/jpg'
)

@cosmopolitan.photo.attach(
  io: URI.open('https://i2.wp.com/gigglesgobblesandgulps.com/wp-content/uploads/2018/06/cosmopolitan-cocktail-recipe.jpg?ssl=1'),
  filename: 'cosmopolitan.jpg',
  content_type: 'image/jpg'
)

@aviation.photo.attach(
  io: URI.open('https://www.liquor.com/thmb/KctFpQHO3zMlzPsV7TbHXFFFh0w=/600x600/filters:max_bytes(150000):strip_icc()/aviation-720x720-article-0ade34c5f15648bf9da5d2ed34e90729.jpg'),
  filename: 'aviation.jpg',
  content_type: 'image/jpg'
)

@darknstormy.photo.attach(
  io: URI.open('https://www.gutekueche.ch/upload/rezept/12441/1600x1200_dark-and-stormy.jpg'),
  filename: 'darknstormy.jpg',
  content_type: 'image/jpg'
)

@vodka_martini.photo.attach(
  io: URI.open('https://static.toiimg.com/thumb/55153262.cms?imgsize=162180&width=800&height=800'),
  filename: 'vodka_martini.jpg',
  content_type: 'image/jpg'
)

@french75.photo.attach(
  io: URI.open('https://i0.wp.com/www.imbored-letsgo.com/wp-content/uploads/2013/07/Lemon-Drop-Martini_.jpg?resize=680%2C991'),
  filename: 'french75.jpg',
  content_type: 'image/jpg'
)

@manhattan.photo.attach(
  io: URI.open('https://assets.punchdrink.com/wp-content/uploads/2013/09/Manhattan.jpg'),
  filename: 'manhattan.jpg',
  content_type: 'image/jpg'
)

@bloodandsand.photo.attach(
  io: URI.open('https://drraa3ej68s2c.cloudfront.net/wp-content/uploads/2014/02/29060712/2b7e80f5-da61-498d-8ed8-0fe9ca295d3b.jpg'),
  filename: 'bloodandsand.jpg',
  content_type: 'image/jpg'
)

@ramos_gin_fizz.photo.attach(
  io: URI.open('https://assets.bonappetit.com/photos/57afbe9253e63daf11a4e6a0/master/pass/ramos-gin-fizz-vid.jpg'),
  filename: 'ramos_gin_fizz.jpg',
  content_type: 'image/jpg'
)
# ---------doses--------
# Aperol Spritz
# 3 ounces prosecco
# 2 ounces Aperol
# 1 ounce soda water
# Garnish: orange wheel
puts "adding ingredients to aperol spritz"

Dose.create!(
  description: '3 ounces ',
  cocktail: @aperol,
  ingredient: Ingredient.new(name: "Prosecco")
)

Dose.create!(
  description: '2 ounces ',
  cocktail: @aperol,
  ingredient: Ingredient.new(name: "Aperol")
  )

Dose.create!(
  description: '1 ounce ',
  cocktail: @aperol,
  ingredient: Ingredient.new(name: "soda water")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: @aperol,
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
  description: '10 leaf (blank)s ',
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "fresh mint leaves")
)

Dose.create!(
  description: '1/2 ',
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "lime, cut into 4 wedges")
  )

Dose.create!(
  description: '2 tablespoons ',
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "white sugar")
)

Dose.create!(
  description: '1 cup ',
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "ice cubes")
)

Dose.create!(
  description: '1/2 fluid ounces ',
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "white rum")
)

Dose.create!(
  description: '1/2 cup ',
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "club soda")
)

# Pina Colada
# 1 1/2 cup ice
# 1/2 cup diced pineapple, frozen
# 2 ounces pineapple juice
# 2 ounces Coco Lopez coconut cream
# 1 1/2 ounces white rum
# 1 ounce dark rum
# Pineapple slices

puts "adding ingredients to pina colada"

Dose.create!(
  description: '1 1/2 cup ',
  cocktail: @pina_colada,
  ingredient: Ingredient.find_by(name: "ice cubes")
)

Dose.create!(
  description: '1/2 cup ',
  cocktail: @pina_colada,
  ingredient: Ingredient.new(name: "diced pineapple, frozen")
  )

Dose.create!(
  description: '2 ounces ',
  cocktail: @pina_colada,
  ingredient: Ingredient.new(name: "pineapple juice")
)

Dose.create!(
  description: '2 ounces ',
  cocktail: @pina_colada,
  ingredient: Ingredient.new(name: "Coco Lopez coconut cream")
)

Dose.create!(
  description: '2 1/2 ounces ',
  cocktail: @pina_colada,
  ingredient: Ingredient.find_by(name: "white rum")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @pina_colada,
  ingredient: Ingredient.new(name: "dark rum")
)

Dose.create!(
  description: '(optional)',
  cocktail: @pina_colada,
  ingredient: Ingredient.new(name: "Pineapple slices")
)

# Brandy Alexander
# 1 ounce brandy
# 1 ounce creme de cacao (dark)
# 1 ounce cream
# Garnish: Nutmeg (freshly ground)

puts "adding ingredients to brandy alexander"

Dose.create!(
  description: '1 ounce ',
  cocktail: @brandy_alexander,
  ingredient: Ingredient.new(name: "brandy")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @brandy_alexander,
  ingredient: Ingredient.new(name: "creme de cacao (dark)")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @brandy_alexander,
  ingredient: Ingredient.new(name: "cream")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: @brandy_alexander,
  ingredient: Ingredient.new(name: "Nutmeg (freshly ground)")
)

# Cosmopolitan
# 2 ounces vodka.
# 1 ounce cranberry juice cocktail.
# ¾ ounce fresh lime juice.
# ¾ ounce triple sec.
# Orange twist (for serving)

puts "adding ingredients to cosmopolitan"

Dose.create!(
  description: '2 ounces ',
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "vodka")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "cranberry juice cocktail")
)

Dose.create!(
  description: '3/4 ounce ',
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "fresh lime juice")
)

Dose.create!(
  description: '3/4 ounce ',
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "triple sec.")
)

Dose.create!(
  description: '(optional) ',
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "Orange twist (for serving)")
)

# Aviation
# 2 ounces gin
# 1/2 ounce maraschino liqueur
# 1/2 ounce crème de violette
# 3/4 ounce lemon juice, freshly squeezed
# Garnish: brandied cherry

puts "adding ingredients to aviation"

Dose.create!(
  description: '2 ounces ',
  cocktail: @aviation,
  ingredient: Ingredient.new(name: "gin")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @aviation,
  ingredient: Ingredient.new(name: "Maraschino liqueur")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @aviation,
  ingredient: Ingredient.new(name: "Crème de Violette")
)

Dose.create!(
  description: '3/4 ounce ',
  cocktail: @aviation,
  ingredient: Ingredient.new(name: "lemon juice, freshly squeezed")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: @aviation,
  ingredient: Ingredient.new(name: "brandied cherry")
)

# Dark'n Stormy
# 2 ounces Gosling’s Black Seal rum
# 1/2 ounce lime juice, freshly squeezed
# Ginger beer, to top (about 5 ounces)
# Garnish: lime wedge

puts "adding ingredients to dark'n stormy"

Dose.create!(
  description: '2 ounces ',
  cocktail: @darknstormy,
  ingredient: Ingredient.new(name: "Gosling’s Black Seal rum")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @darknstormy,
  ingredient: Ingredient.new(name: "lime juice, freshly squeezed")
)

Dose.create!(
  description: '5 ounces ',
  cocktail: @darknstormy,
  ingredient: Ingredient.new(name: "ginger beer")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: @darknstormy,
  ingredient: Ingredient.new(name: "lime wedge")
)

# Vodka Martini
# 2 ounces vodka (premium)
# 1/2 to 3/4 ounce dry vermouth (to taste)
# Optional: 2 dashes bitters
# Garnish: lemon twist or 3 olives

puts "adding ingredients to vodka martini"

Dose.create!(
  description: '2 ounces ',
  cocktail: @vodka_martini,
  ingredient: Ingredient.new(name: "vodka(premium)")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @vodka_martini,
  ingredient: Ingredient.new(name: "dry vermouth")
)

Dose.create!(
  description: '2 dashes ',
  cocktail: @vodka_martini,
  ingredient: Ingredient.new(name: "bitters")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: @vodka_martini,
  ingredient: Ingredient.new(name: "lemon twist or 3 olives")
)

# French 75
# 1 ½ ounces gin.
# ¾ ounce fresh lemon juice (about ¾ medium lemon)
# ¾ ounce simple syrup (recipe follows)
# 2 to 3 ounces chilled Champagne (enough to top the glass)
# Lemon peel, for garnish.

puts "adding ingredients to french 75"

Dose.create!(
  description: '1 1/2 ounces ',
  cocktail: @french75,
  ingredient: Ingredient.find_by(name: "gin")
)

Dose.create!(
  description: '3/4 ounce ',
  cocktail: @french75,
  ingredient: Ingredient.new(name: "fresh lemon juice (about ¾ medium lemon)")
)

Dose.create!(
  description: '3/4 ounce ',
  cocktail: @french75,
  ingredient: Ingredient.new(name: "simple syrup")
)

Dose.create!(
  description: '3 ounces ',
  cocktail: @french75,
  ingredient: Ingredient.new(name: "chilled Champagne")
)

Dose.create!(
  description: 'Garnish: ',
  cocktail: @french75,
  ingredient: Ingredient.new(name: "Lemon peel")
)

# Manhattan
# 2 dashes angostura bitters.
# 1 ounce sweet vermouth.
# 2 1/2 ounces bourbon, such as Buffalo Trace.
# 1 maraschino cherry.

puts "adding ingredients to manhattan"

Dose.create!(
  description: '2 dashes ',
  cocktail: @manhattan,
  ingredient: Ingredient.new(name: "angostura bitters")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @manhattan,
  ingredient: Ingredient.new(name: "sweet vermouth")
)

Dose.create!(
  description: '2 1/2 ounces ',
  cocktail: @manhattan,
  ingredient: Ingredient.new(name: "bourbon")
)

Dose.create!(
  description: '1 ',
  cocktail: @manhattan,
  ingredient: Ingredient.new(name: "maraschino cherry")
)

# Blood and Sand
# 1 ounce blended Scotch, such as Compass Box Asyla.
# 1 ounce sweet vermouth.
# 1 ounce cherry liqueur, preferably Heering.
# 1 ounce fresh orange juice.
# Ice.
# 1 orange wheel, for garnish.

puts "adding ingredients to blood and sand"

Dose.create!(
  description: '1 ounce ',
  cocktail: @bloodandsand,
  ingredient: Ingredient.new(name: "blended Scotch")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @bloodandsand,
  ingredient: Ingredient.find_by(name: "sweet vermouth")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @bloodandsand,
  ingredient: Ingredient.new(name: "cherry liqueur")
)

Dose.create!(
  description: '1 ounce ',
  cocktail: @bloodandsand,
  ingredient: Ingredient.new(name: "fresh orange juice")
)

# Ramos Gin Fizz
# 2 ounces gin.
# 1/2 ounce heavy cream.
# 1/2 ounce lemon juice, freshly squeezed.
# 1/2 ounce fresh lime juice, freshly squeezed.
# 3/4 ounce simple syrup.
# 3 dashes orange flower water.
# 1 fresh egg white.
# Club soda, to top.

puts "adding ingredients to ramos gin fizz"

Dose.create!(
  description: '2 ounces ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.find_by(name: "gin")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.new(name: "heavy cream")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.find_by(name: "lemon juice, freshly squeezed")
)

Dose.create!(
  description: '1/2 ounce ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.new(name: "fresh lime juice, freshly squeezed")
)

Dose.create!(
  description: '3/4 ounce ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.find_by(name: "simple syrup")
)

Dose.create!(
  description: '3 dashes ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.new(name: "orange flower water")
)

Dose.create!(
  description: '1 fresh ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.new(name: "egg white")
)

Dose.create!(
  description: 'top with ',
  cocktail: @ramos_gin_fizz,
  ingredient: Ingredient.find_by(name: "club soda")
)
