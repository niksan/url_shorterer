class Url < ApplicationRecord
  AVAILABLE_SCHEMES = %w(http https).freeze
  validates :short, presence: true, uniqueness: true
  validates :full, presence: true, format: { with: URI.regexp(AVAILABLE_SCHEMES) }

  has_many :url_stats
end
