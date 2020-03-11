# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

city_array = []
8.times do 
  c = City.create(city_name: Faker::Address.city)
  city_array << c
end
puts "8 cities random ont été créées"
ds_array = []
8.times do 
  ds = Dogsitter.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", city: city_array.sample)
  ds_array << ds
end
puts "8 Dogsitters random ont été créés"
dog_array = []
12.times do 
  d = Dog.create(name: Faker::Name.first_name, city: city_array.sample)
  dog_array << d
end
puts "12 Dogs random ont été créés"
stroll_array = []
14.times do
  s = Stroll.create(dogsitter: ds_array.sample, dog: dog_array.sample, city: city_array.sample)
  stroll_array << s
end
puts "14 Strolls random ont été créés"


# # RETOUR A ZERO DE TOUTE LES TABLES
# Stroll.destroy_all
# Dog.destroy_all
# Dogsitter.destroy_all
# DogStroll.destroy_all
# City.destroy_all

# #CREATION DES ARRAYS, POUR SELECTION HASARD DE L'ID
# dog_array = []
# dogsitter_array = []
# city_array = []
# stroll_array = []

# # CREATION TABLE CITY
# # INDEX PERMET DE REPARTIR A L'ID NUMERO 1
# 5.times do |index|
# c = City.create(id: (index +1 ), city_name: Faker::Address.city)
# city_array << c
# end

# puts "'City' created"

# # CREATION DES TABLES DOG ET DOGSITTER
# # INDEX PERMET DE REPARTIR A L'ID NUMERO 1
# 5.times do |index|
# d = Dog.create(id: (index + 1), name: Faker::DcComics.unique.hero, city: city_array.sample)
# dog_array << d
# ds = Dogsitter.create(id: (index +1 ), name: Faker::DcComics.unique.villain, city: city_array.sample)
# dogsitter_array << ds
# end

# puts "'Dog' and 'Dogsitter' created"

# # CREATION TABLE STROLL
# # INDEX PERMET DE REPARTIR A L'ID NUMERO 1
# 5.times do |index|
# s = Stroll.create(id: (index+1), date: Faker::Date.between(from: 5.days.ago, to: Date.today), dogsitter: dogsitter_array.sample)
# stroll_array << s
# end

# puts "'Stroll' created"

# # CREATION TABLE STROLLDOG
# # INDEX PERMET DE REPARTIR A L'ID NUMERO 1
# 5.times do |index|
# sd = StrollDog.create(id: (index+1), dog: dog_array.sample, stroll: stroll_array.sample)
# end

# puts "'StrollDog' created"
# puts "Seed created done"