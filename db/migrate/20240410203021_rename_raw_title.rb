# frozen_string_literal: true

class RenameRawTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :showtimes, :movie_title, :raw_title
  end
end
