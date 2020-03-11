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
