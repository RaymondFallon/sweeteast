# frozen_string_literal: true

namespace :showtimes do
  desc 'Scrape showtimes from the web'
  task scrape: %i[environment] do
    Showtime.delete_all
    Scrapers::Pgt.new.run
    Scrapers::Showroom.new.run
    Scrapers::CinemaHosting.new(Theater.find_by(code: 'montgomery')).run
    Scrapers::CinemaHosting.new(Theater.find_by(code: 'smodcastle')).run
    Scrapers::Barrymore.new.run
  end
end
