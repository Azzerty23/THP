# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user_array = []
10.times do
  u = User.create!(first_name: Faker::Name.first_name)
  user_array << u
end
puts "10 User crées"
gossip_array = []
50.times do
  g = Gossip.create!(title: Faker::Lorem.sentence(word_count: 2, supplemental: false, random_words_to_add: 4),
                content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 1),
                author: user_array.sample)
end
puts "50 Gossip crées"