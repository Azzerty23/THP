# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Comment.destroy_all
Like.destroy_all
Frienship.destroy_all

city_array = []
user_array = []
gossip_array = []

10.times do
  c = City.create!(name: Faker::Address.city)
    # zip_code: "34#{Faker::Number.number(digits: 3)}"
  city_array << c
  end

puts "Cities created"


20.times do
  u = User.create!( 
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    city: city_array.sample,
    email: Faker::Internet.email, 
    password: Faker::Lorem.word)
    # phone_number: "+33#{Faker::Number.number(digits: 9)}" # Faker::PhoneNumber.phone_number
  user_array << u
  end

tp User.all
# pp user_array

puts "Users created"


50.times do
  g = Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 1, supplemental: false, random_words_to_add: 4),
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 1),
    author: user_array.sample)
  gossip_array << g
end    

puts "Gossips created"

100.times do
  Comment.create(
    commenter: user_array.sample,
    gossip: gossip_array.sample,
    content: Faker::Lorem.paragraph(sentence_count: 1, supplemental: false, random_sentences_to_add: 1))
  end

puts "Comments created"



200.times do
  Like.create(
    liker: user_array.sample,
    gossip: gossip_array.sample)
  end

puts "Likes created"


30.times do
  asker = rand(user_array.length)
  responder = rand(user_array.length)
  while asker == responder
    responder = rand(user_array.length) 
  end

  Frienship.create(
    asker: user_array[asker],
    responder: user_array[responder])
  end

puts "Friendships created"

