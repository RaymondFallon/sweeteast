# frozen_string_literal: true

class Showtime < ApplicationRecord
  belongs_to :theater
  belongs_to :movie

  validates :start_datetime,
            presence: true
  validates :start_datetime, uniqueness: { scope: %i[movie theater_id] }

  scope :for_date, ->(date) { where(start_datetime: date.all_day) }
  scope :scraped, -> { where(manually_added: false) }
  scope :this_week, -> { where(start_datetime: (Time.zone.today.beginning_of_day)..(6.days.from_now.end_of_day)) }
  scope :upcoming, -> { where('start_datetime > ?', Time.zone.today.beginning_of_day) }

  before_validation :assign_movie, on: :create

  def assign_movie
    return if movie.present?

    aliass = MovieAlias.find_or_create_by(text: raw_title)
    self.movie = aliass.movie
  end

  def date
    start_datetime.to_date
  end

  def time_of_day
    start_datetime.strftime('%l:%M %P')
  end
end
