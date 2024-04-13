class AddMovieIdToShowtimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :showtimes, :movie, null: false, foreign_key: true
  end
end
