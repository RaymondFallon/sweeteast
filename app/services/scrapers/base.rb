require 'nokogiri'
require 'open-uri'

module Scrapers
  class Base
    attr_reader :theater, :url

    def scrape_showtimes
      raise NotImplementedError, "Subclasses must implement scrape_showtimes method"
    end

    private

    def fetch_html(url)
      Nokogiri::HTML(URI.open(url))
    end
  end
end
