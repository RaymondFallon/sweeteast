# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    association :author

    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraphs(number: 12).join("\n\n") }
    published_at { Faker::Date.between(from: 21.days.ago, to: 5.days.from_now) }

    trait :by_existing_author do
      author { Author.all.sample }
    end

    trait :published do
      published_at { Faker::Date.between(from: 10.days.ago, to: Time.zone.today.beginning_of_day) }
    end

    trait :unpublished do
      published_at { Faker::Date.between(from: 1.day.from_now, to: 10.days.from_now) }
    end
  end
end
