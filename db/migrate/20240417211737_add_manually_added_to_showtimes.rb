class AddManuallyAddedToShowtimes < ActiveRecord::Migration[7.0]
  def change
    add_column :showtimes, :manually_added, :boolean, default: false
  end
end
