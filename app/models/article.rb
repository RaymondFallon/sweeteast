# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author

  has_rich_text :body

  validates :title, :published_at,
            presence: true
end
