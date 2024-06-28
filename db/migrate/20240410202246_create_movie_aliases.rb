# frozen_string_literal: true

class CreateMovieAliases < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_aliases do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :text, null: false

      t.timestamps
    end
  end
end
