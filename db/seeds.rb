# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


puts 'Seeding New Ingredients...'
print '['
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  print '+ '
end
puts ']'
puts 'Completed Seeding Ingredients'


puts 'Seeding Sample Cocktails'
Cocktail.create(name: 'Apple Martini')
Cocktail.create(name: 'Long Island Ice Tea')
Cocktail.create(name: 'Californication')
Cocktail.create(name: 'Pina Colada')
Cocktail.create(name: 'Margarita')
Cocktail.create(name: 'Caipirinha')
Cocktail.create(name: 'Mint Julep')
Cocktail.create(name: 'Mai Tai')
Cocktail.create(name: 'Mojito')
puts 'Completed Seeding Drinks'

puts 'Pouring you a drink: Tom Collins'
@tom = Cocktail.create(name: 'Tom Collins')
puts '🍸'


@ice = Ingredient.where(name: 'Ice').first
puts '🥶 Adding Ice'
@gin = Ingredient.where(name: 'Gin').first
puts '🌲 Adding Gin'
@lemonjuice = Ingredient.where(name: 'Lemon juice').first
puts '🍋 Adding Lemon'
@syrup = Ingredient.where(name: 'Sugar Syrup').first
puts '🍭 Adding Sugar'
@clubsoda = Ingredient.where(name: 'Carbonated water').first
puts '🥤 Adding Club Soda'

puts 'Mixing\n'

150.times { print '*' }

Dose.create(description: '1.5 Cups',
            cocktail: @tom,
            ingredient: @ice)

Dose.create(description: '2 Oz',
            cocktail: @tom,
            ingredient: @gin)

Dose.create(description: '0.75 Oz',
            cocktail: @tom,
            ingredient: @lemonjuice)

Dose.create(description: '0.5 Oz',
            cocktail: @tom,
            ingredient: @syrup)

Dose.create(description: '1.5 Cups',
            cocktail: @tom,
            ingredient: @ice)

Dose.create(description: '2 Oz',
            cocktail: @tom,
            ingredient: @clubsoda)

puts ' '
puts 'Done... Enjoy!'
