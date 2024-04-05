class AddPreviewTextToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :preview_text, :string
  end
end
