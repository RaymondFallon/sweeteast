
module Scrapers
  class Williams < Base
    def initialize
      @theater = Theater.find_by(code: 'williams')
      @url = @theater.external_url
    end

    def scrape_showtimes
      movies = JSON.parse(fetch_html('https://www.viewcy.com/api/o/cinemaunderground/courses'))['data']
      movies.each do |movie_hash|
        movie_title = movie_hash['name']
        movie_hash['events'].each do |showtime_hash|
          start_datetime = Time.zone.parse(showtime_hash['starts_at'])
          Showtime.create!(theater: theater, movie_title: movie_title, start_datetime: start_datetime)
        end
      end
    end
  end
end
