# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author

  has_rich_text :content

  validates :title, :published_at,
            presence: true

  scope :published, -> { where('published_at <= ?', Time.zone.today.end_of_day) }

  def preview
    preview_text ||
      content.to_plain_text[0..2000].split(' ').shift(75).join(' ') + ' ...'
  end

  def published?
    published_at.present? &&
      published_at <= Time.zone.today.end_of_day
  end
end
