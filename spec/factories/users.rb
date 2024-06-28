# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { 'password' }
    email { Faker::Internet.email }

    trait :admin do
      email { 'admin@example.com' }
    end
  end
end
