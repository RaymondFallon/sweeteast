# frozen_string_literal: true

class Theater < ApplicationRecord
  has_many :showtimes, dependent: :restrict_with_error

  validates :name, :external_url, :address, :zip_code,
            presence: true
  validates :name, :code,
            uniqueness: true
end
