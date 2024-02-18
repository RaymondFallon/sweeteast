# frozen_string_literal: true

class Showtime < ApplicationRecord
  belongs_to :theater

  validates :movie_title, :start_datetime,
            presence: true
  validates_uniqueness_of :start_datetime, scope: [:movie_title, :theater_id]

  scope :upcoming, -> { where('start_datetime > ?', Time.zone.today.beginning_of_day) }
  scope :for_date, ->(date) { where(start_datetime: date.beginning_of_day..date.end_of_day) }

  def date
    start_datetime.to_date
  end

  def time_of_day
    start_datetime.strftime('%l:%M %P')
  end
end

