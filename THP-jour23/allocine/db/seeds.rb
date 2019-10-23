# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
  Movie.create(name: Faker::Music.album, year: rand(1920..2019), genre: Faker::Music.genre, director: Faker::Artist.name, synopsis: Faker::Lorem.paragraphs(number: 1), allocine_rating: Faker::Number.decimal(l_digits: 1, r_digits: 2), my_rating: rand(0..10), already_seen: rand(0..1))
end

# Movie.where(["genre like ?", "Faker%"]).update_all(genre: Faker::Music.genre)


Movie.where(["genre like ?", "Rap%"]).each do |movie|
  movie.update(genre: Faker::Music.genre)
end