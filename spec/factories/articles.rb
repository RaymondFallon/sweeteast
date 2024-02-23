FactoryBot.define do
  factory :article do
    association :author

    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraphs(number: 12).join("\n\n") }
    published_at { Faker::Date.between(from: 21.days.ago, to: 5.days.from_now) }

    trait :by_existing_author do
      author { Author.all.sample }
    end
  end
end
