# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :aliases, class_name: 'MovieAlias', dependent: :destroy
  has_many :showtimes, dependent: :destroy

  validates :title,
            presence: true

  accepts_nested_attributes_for :aliases, reject_if: :all_blank

  default_scope { order(:title) }
  scope :this_week, -> { joins(:showtimes).merge(Showtime.this_week).distinct }
  scope :for_date, ->(date) { joins(:showtimes).merge(Showtime.for_date(date)).distinct }
end
