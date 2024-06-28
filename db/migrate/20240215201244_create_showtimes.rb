# frozen_string_literal: true

class CreateShowtimes < ActiveRecord::Migration[7.0]
  def change
    create_table :showtimes do |t|
      t.datetime :start_datetime
      t.string :movie_title
      t.string :external_url
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
