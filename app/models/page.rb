class Page < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :urlname, presence: true, length: { minimum: 1 }, uniqueness: true
end
