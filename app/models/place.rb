class Place < ApplicationRecord
  validates :place_name, :img_url, presence: true
  has_many :packages
  has_many :hotels
end
