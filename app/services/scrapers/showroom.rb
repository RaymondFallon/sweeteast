# frozen_string_literal: true

module Scrapers
  class Showroom < Base
    def initialize
      @theater = Theater.find_by(code: 'showroom')
      @url = @theater.external_url
    end

    def scrape_showtimes
      # Fetch the next 3(?) days of showtimes
      fetch_html(url).css('.date-nav nav a').each do |date_link|
        date = date_link.text
        html_for_day = fetch_html(date_link.attribute('href').value)

        title_nodes = html_for_day.css('#now-playing div.show')
        time_nodes = html_for_day.css('#now-playing ol.showtimes')

        if title_nodes.size == time_nodes.size
          (0...title_nodes.size).each do |idx|
            raw_title = title_nodes[idx].css('a h2').text
            times = time_nodes[idx].css('li a').map(&:text)

            create_records_for_times(raw_title, date, times)
          end
        else
          Rails.logger.info "title_nodes count != time_nodes count for #{date}"
        end
      end

      # Fetch the Special Events
      fetch_html('https://showroomcinemas.com/coming-soon/').css('.show-details').each do |event_node|
        title = event_node.css('h2 a').text
        date = event_node.css('.selected-date span').text
        times = event_node.css('ol.showtimes li a').map(&:text)

        create_records_for_times(title, date, times)
      end
    end

    private

    def parse_start_datetime(date, time)
      Time.zone.parse("#{date} #{time}")
    end
  end
end
