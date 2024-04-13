# frozen_string_literal: true

FactoryBot.define do
  factory :movie_alias do
    movie
    text { Faker::Movie.title.downcase }
  end
end
