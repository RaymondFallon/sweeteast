# frozen_string_literal: true

class MovieAlias < ApplicationRecord
  belongs_to :movie, inverse_of: :aliases

  validates :text,
            presence: true
  validates_uniqueness_of :text

  before_validation :find_or_create_movie, on: :create

  def find_or_create_movie
    return if movie.present?

    self.movie_id = Movie.find_or_create_by(title: text).id
  end
end
