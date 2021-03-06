# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(0..20).each do
  Podcast.create(itunes_id: Faker::Number.number(10), name: Faker::Superhero.name, track_name:  Faker::Pokemon.name, feed_url: Faker::Internet.url, art: Faker::Avatar.image("my-own-slug", "100x100"))
end
