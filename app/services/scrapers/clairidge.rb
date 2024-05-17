
module Scrapers
  class Clairidge < Base
    def initialize
      @theater = Theater.find_by(code: 'clairidge')
      @url = 'https://theclairidge.org/all-event/'
    end

    def scrape_showtimes
      fetch_html(url).css('.event_days .event_days_inner a').each do |date_link|
        date_str = date_link.text.squish
        html_for_day = fetch_html(@url + date_link.attribute('href').value)

        html_for_day.css('.events_list .events_list_data').each do |showtime_node|
          title = showtime_node.css('h3').text.squish
          times = showtime_node.css('.events_list_times .events_list_times_box').map { _1.text.strip }

          create_records_for_times(title, date_str, times)
        end
      end
    end

    private

    def parse_start_datetime(date, time)
      Time.zone.parse("#{date} #{time}")
    end
  end
end
