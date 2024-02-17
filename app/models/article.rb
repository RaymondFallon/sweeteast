# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author
  
  validates :title, presence: true
end
