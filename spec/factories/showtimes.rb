FactoryBot.define do
  factory :showtime do
    association :theater

    raw_title { Faker::Movie.title }
    start_datetime { Faker::Time.between(from: 1.day.ago, to: 2.days.from_now) }
    external_url { Faker::Internet.url }

    trait :for_existing_theater do
      theater { Theater.all.sample }
    end

    trait :for_today do
      start_datetime { Faker::Time.between(from: Time.zone.now.beginning_of_day, to: Time.zone.now.end_of_day) }
    end

    trait :for_existing_theater_and_movie do
      theater { Theater.all.sample }
      raw_title { theater.showtimes.sample.raw_title }
    end
  end
end
