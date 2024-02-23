
module Scrapers
  # shared code for scraping showtimes from a cinema hosting website (Smodcastle, Montgomery, etc.)
  class CinemaHosting < Base
    def initialize(theater)
      @theater = theater
      @url = @theater.external_url
    end

    def scrape_showtimes
      fetch_html(url).css('.dateslider ul.slides li a').each do |date_link|
        date_path = date_link.attribute('href').value
        date_str = date_link.css('span.month').text + ' ' + date_link.css('span.date').text

        html_for_day = fetch_html(URI.join(url, date_path).to_s)

        html_for_day.css('.movielist .moviepad').each do |showtime_node|
          title = showtime_node.css('.mtitle').text
          times = showtime_node.css('.showtimes .iteminfo a').map { _1.text.strip }

          create_records_for_times(title, date_str, times)
        end
      end
    end

    private

    def create_records_for_times(title, date, times)
      times.each do |time|
        start_datetime = parse_start_datetime(date, time.strip)
        Showtime.create(theater: theater, movie_title: title.strip, start_datetime: start_datetime)
      end
    end

    def parse_start_datetime(date, time)
      # Add a space before 'p' and 'a' to make the time parsing work
      time = time.gsub('p', ' PM').gsub('a', ' AM')
      Time.zone.parse("#{date} #{time}")
    end
  end
end
