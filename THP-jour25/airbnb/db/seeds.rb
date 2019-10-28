# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Pense bien sûr à faire un petit seed qui va :

require 'faker'

# Détruire ta base actuelle
# Créer 20 utilisateurs
# Créer 10 villes
# Créer 50 listings
# Pour chaque listing
# Créer 5 réservations dans le passé
# Créer 5 réservations dans le futur

User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

user_array = []
city_array = []
listing_array = []
reservation_array = []

# Faker::Config.locale = 'fr-FR'

20.times do |i|
  u = User.create!(id: i+1, 
    email: Faker::Internet.email, 
    phone_number: "+33#{Faker::Number.number(digits: 9)}", # Faker::PhoneNumber.phone_number
    description: Faker::Lorem.sentence(word_count: 50, supplemental: false, random_words_to_add: 4))
  user_array << u
  end

tp User.all
# pp user_array

puts "Users created"

10.times do
  c = City.create!(name: Faker::Address.city,
    zip_code: "34#{Faker::Number.number(digits: 3)}")
  city_array << c
  end

puts "Cities created"

50.times do
  l = Listing.create!(available_beds: Faker::Number.non_zero_digit, 
    price: Faker::Number.within(range: 5..100),
    description: Faker::Lorem.sentence(word_count: 50, supplemental: false, random_words_to_add: 4),
    has_wifi: rand(0..1),
    welcome_message: Faker::Lorem.sentence(word_count: 5),
    administrator: user_array.sample,
    city: city_array.sample)

  listing_array << l
  end

puts "Listings created"


listing_array.each do |listing|
  
  5.times do
    start_date = Faker::Date.between(from: 1.year.ago, to: 6.month.ago)
    r = Reservation.create!(start_date: start_date,
      end_date: Faker::Date.between(from: start_date + 1, to: 1.day.ago),
      guest: user_array.sample,
      listing: listing_array.sample)

      listing.reservations << r

    start_date = Faker::Date.between(from: 1.day.from_now, to: 1.month.from_now)
    r = Reservation.create!(start_date: start_date,
      end_date: Faker::Date.between(from: start_date + 1, to: 1.year.from_now),
      guest: user_array.sample,
      listing: listing_array.sample)

      listing.reservations << r
    end
  end

puts "Reservations created"
