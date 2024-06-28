# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

module Scrapers
  class Base
    attr_reader :theater, :url

    def run
      Rails.logger.debug { "Scraping showtimes for #{theater.name}..." }
      scrape_showtimes
      Rails.logger.debug { "Finished scraping showtimes for #{theater.name}." }
    rescue StandardError => e
      Rails.logger.debug { "Error scraping showtimes for #{theater.name}: #{e.message}" }
    end

    def scrape_showtimes
      raise NotImplementedError, 'Subclasses must implement scrape_showtimes method'
    end

    private

    # rubocop:disable Security/Open
    def fetch_html(url)
      Nokogiri::HTML(URI.open(url))
    end
    # rubocop:enable Security/Open

    def create_records_for_times(title, date, times)
      times.each do |time|
        start_datetime = parse_start_datetime(date, time.strip)
        Showtime.create(theater: theater, raw_title: title.strip, start_datetime: start_datetime)
      end
    end
  end
end
