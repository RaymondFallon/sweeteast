
require 'json'

module Scrapers
  class Barrymore < Base
    def initialize
      @theater = Theater.find_by(code: 'barrymore')
      @url = @theater.external_url

      @collection_id = fetch_html(url).css('body').first.attributes['id'].value[11..]
    end

    def scrape_showtimes
      [Time.zone.now, 1.month.from_now].map { _1.strftime('%m-%Y') }.each do |month_year|
        month_url = URI.join(url, "api/open/GetItemsByMonth?month=#{month_year}&collectionId=#{@collection_id}")
        body = JSON.parse(month_url.read)

        body.each do |event|
          title = event['title']
          # datetime = Time.at((event['startDate'] / 1000) - 5.hours)
          # Showtime.create!(theater: theater, raw_title: title, start_datetime: datetime)

          event_url = URI.join(url, event['urlId'])
          event_html = fetch_html(event_url)
          date = event_html.css('time.event-date').first.text
          time = event_html.css('time.event-time-12hr-start').first.text

          Showtime.create!(theater: theater, raw_title: title, start_datetime: parse_start_datetime(date, time))

          # wait some seconds to avoid rate limiting. Not practical for production, but while testing...
          sleep 5
        end
      end
    end

    private

    def parse_start_datetime(date, time)
      Time.zone.parse("#{date} #{time}")
    end
  end
end
