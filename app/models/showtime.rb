# frozen_string_literal: true

class Showtime < ApplicationRecord
  belongs_to :theater

  validates :movie_title, :start_datetime, :external_url,
            presence: true

  scope :upcoming, -> { where('start_datetime > ?', Time.zone.now) }

  def date
    start_datetime.to_date
  end

  def time_of_day
    start_datetime.strftime('%l:%M %P')
  end
end

