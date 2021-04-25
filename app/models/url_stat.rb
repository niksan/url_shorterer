class UrlStat < ApplicationRecord
  validates :ip, presence: true, uniqueness: { scope: :url_id }

  belongs_to :url
end
