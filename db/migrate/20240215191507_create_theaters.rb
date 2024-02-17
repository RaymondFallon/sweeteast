class CreateTheaters < ActiveRecord::Migration[7.0]
  def change
    create_table :theaters do |t|
      t.string :name
      t.string :code
      t.string :external_url
      t.string :address
      t.string :zip_code

      t.timestamps
    end
  end
end
