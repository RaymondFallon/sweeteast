# frozen_string_literal: true

class AddSpotlightedToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :spotlighted, :boolean, default: false
  end
end
