class WebsiteSetting < ApplicationRecord
  validates :homepage_id, presence: true
end
