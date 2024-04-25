
require 'json'

module Scrapers
  class Acme < Base
    def initialize
      @theater = Theater.find_by(code: 'acme')
      @url = @theater.external_url
    end

    def scrape_showtimes
      fetch_html(url).css('.eventlist article.eventlist-event').each do |event_node|
        title = event_node.css('.eventlist-title').text
        date = event_node.css('.event-date').text
        start_time = event_node.css('.event-time-localized-start').text

        create_records_for_times(title, date, [start_time])
      end
    end

    private

    def parse_start_datetime(date, time)
      # Add a space before 'p' and 'a' to make the time parsing work
      time = time.gsub('p', ' PM').gsub('a', ' AM')
      Time.zone.parse("#{date} #{time}")
    end
  end
end
