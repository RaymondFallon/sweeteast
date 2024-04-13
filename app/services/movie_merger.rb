
# Merges two movies into one, and combines their Showtimes and MovieAliases.
class MovieMerger

  attr_reader :movie1

  def initialize(movie1_id, movie2_id)
    @movie1 = Movie.find(movie1_id)
    @movie2 = Movie.find(movie2_id)
  end

  def merge
    Movie.transaction do
      merge_aliases
      merge_showtimes
      @movie2.destroy
    end
  end

  private

  def merge_aliases
    @movie2.aliases.update_all(movie_id: @movie1.id)
  end

  def merge_showtimes
    @movie2.showtimes.each do |showtime|
      showtime.assign_attributes(movie_id: @movie1.id)

      # If showtime is invalid, we probably already have a showtime for movie1 and if not, c'est la vie.
      showtime.save || showtime.destroy
    end
  end
end
