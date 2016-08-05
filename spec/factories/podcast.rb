FactoryGirl.define do
  factory :podcast do
    itunes_id Faker::Number.number(10)
    name Faker::Superhero.name
    track_name  Faker::Pokemon.name
    feed_url Faker::Internet.url
    art Faker::Avatar.image("my-own-slug", "100x100")
  end
end
