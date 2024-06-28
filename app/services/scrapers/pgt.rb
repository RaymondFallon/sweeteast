# frozen_string_literal: true

module Scrapers
  class Pgt < Base
    def initialize
      @theater = Theater.find_by(code: 'pgt')
      @url = @theater.external_url
    end

    def scrape_showtimes
      fetch_html(url).css('#box-times').each do |showtime_node|
        raw_title = showtime_node.css('a.title').text
        movie_path = showtime_node.css('a.title').attribute('href').value
        movie_url = URI.join(url, movie_path).to_s

        movie_html = fetch_html(movie_url)

        # Regular movies, multiple showtimes per day
        movie_html.css('.tickets-list .date-container').each do |showtime_node|
          date = showtime_node.css('.date').text
          times = showtime_node.css('.session-times li a').map { _1.text.strip }
          times.each do |time|
            start_datetime = parse_start_datetime(date, time)
            Showtime.create!(theater: theater, raw_title: raw_title, start_datetime: start_datetime)
          end
        end

        # Special events, single showtime per day (?)
        movie_html.css('#film-tickets .timeslot').each do |showtime_node|
          next if showtime_node.css('a.time').text.blank? # Ignore some weird hidden elements for "Wed Dec 31"

          date = showtime_node.css('.day').text
          time = showtime_node.css('a.time').text.strip
          start_datetime = parse_start_datetime(date, time)
          Showtime.create!(theater: theater, raw_title: raw_title, start_datetime: start_datetime)
        end
      end
    end

    private

    def parse_start_datetime(date, raw_time)
      time = raw_time.match?(/a/i) ? raw_time : "#{raw_time} PM"
      Time.zone.parse("#{date} #{time}")
    end
  end
end
