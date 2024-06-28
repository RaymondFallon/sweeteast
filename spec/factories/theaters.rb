# frozen_string_literal: true

FactoryBot.define do
  factory :theater do
    name { Faker::Company.name }
    code { Faker::Alphanumeric.alpha(number: 3) }
    external_url { Faker::Internet.url }
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
  end
end
