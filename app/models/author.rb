# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :articles, dependent: :nullify

  has_rich_text :bio

  validates :name, presence: true
end
