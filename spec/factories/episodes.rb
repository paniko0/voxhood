FactoryGirl.define do
  factory :episode do
    entry_id Faker::Bitcoin.address
    title Faker::Address.city
    download_link Faker::Internet.url
    url Faker::Internet.url
    duration "00:00"
    publication_date Faker::Time.between(2.days.ago, Date.today, :all)
    summary Faker::Hipster.paragraph
  end
end
