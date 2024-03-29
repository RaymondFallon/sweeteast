require 'nokogiri'
require 'open-uri'

module Scrapers
  class Base
    attr_reader :theater, :url

    def run
      p "Scraping showtimes for #{theater.name}..."
      scrape_showtimes
      p "Finished scraping showtimes for #{theater.name}."
    end

    def scrape_showtimes
      raise NotImplementedError, "Subclasses must implement scrape_showtimes method"
    end

    private

    def fetch_html(url)
      Nokogiri::HTML(URI.open(url))
    end
  end
end
