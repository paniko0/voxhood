FactoryGirl.define do
  factory :podcast do
    name Faker::Superhero.name
    author  Faker::Pokemon.name
    image Faker::Avatar.image("my-own-slug", "100x100")
  end
end
