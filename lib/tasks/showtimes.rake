# frozen_string_literal: true

namespace :showtimes do
  desc 'Scrape showtimes from the web'
  task scrape: %i[environment] do
    Showtime.delete_all
    Scrapers::Pgt.new.run
    Scrapers::Showroom.new.run
    Scrapers::CinemaHosting.new(Theater.find_by(code: 'montgomery')).run
    Scrapers::CinemaHosting.new(Theater.find_by(code: 'smodcastle')).run
    Scrapers::Williams.new.run
    Scrapers::Clairidge.new.run

    # Run last since it's most likely to fail (with a 429). Better still would be to handle the 429 gracefully.
    Scrapers::Barrymore.new.run
  end

  desc 'Test scrape one theater'
  task test_scrape: %i[environment] do
    return unless Rails.env.development?

    # theater = Theater.find_by(code: 'delsea')
    # theater.showtimes.delete_all
    # Scrapers::Delsea.new.run
  end
end
