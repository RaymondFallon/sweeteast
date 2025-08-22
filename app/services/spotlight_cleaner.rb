# frozen_string_literal: true

# Remove the spotlight from movies if there are no more showtimes for it
# Remember: all showtimes are deleted every day and upcoming showtimes are re-scraped from websites
class SpotlightCleaner
  def self.run
    Movie.where(spotlighted: true).find_each do |movie|
      next if movie.showtimes.any?

      movie.update(spotlighted: false)
    end
  end
end
