# frozen_string_literal: true

namespace :showtimes do
  desc 'Scrape showtimes from the web'
  task scrape: %i[environment] do
    Scrapers::Pgt.new.scrape_showtimes
  end
end
