# frozen_string_literal: true

require 'json'

module Scrapers
  class Barrymore < Base
    def initialize
      @theater = Theater.find_by(code: 'barrymore')
      @url = @theater.external_url
    end

    def scrape_showtimes
      schedule_url = URI.join(url, 'full-schedule')
      fetch_html(schedule_url).css('.eventlist article.eventlist-event').each do |event_node|
        title = event_node.css('.eventlist-title').text
        date = event_node.css('.event-date').text
        start_time = event_node.css('.event-time-localized-start').text

        create_records_for_times(title, date, [start_time])
      end
    end

    # def scrape_showtimes
    #   [Time.zone.now, 1.month.from_now].map { _1.strftime('%m-%Y') }.each do |month_year|
    #     month_url = URI.join(url, "api/open/GetItemsByMonth?month=#{month_year}&collectionId=#{@collection_id}")
    #     body = JSON.parse(month_url.read)

    #     body.each do |event|
    #       title = event['title']
    #       # datetime = Time.at((event['startDate'] / 1000) - 5.hours)
    #       # Showtime.create!(theater: theater, raw_title: title, start_datetime: datetime)

    #       event_url = URI.join(url, event['urlId'])
    #       event_html = fetch_html(event_url)
    #       debugger
    #       date = event_html.css('time.event-date').first.text
    #       time = event_html.css('time.event-time-12hr-start').first.text

    #       Showtime.create!(theater: theater, raw_title: title, start_datetime: parse_start_datetime(date, time))

    #       # wait some seconds to avoid rate limiting. Not practical for production, but while testing...
    #       sleep 5
    #     end
    #   end
    # end

    private

    def parse_start_datetime(date, time)
      Time.zone.parse("#{date} #{time}")
    end
  end
end
