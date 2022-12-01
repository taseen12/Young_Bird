class Hotel < ApplicationRecord
  validates :hotel_name, :hotel_type, :location, :img_url, :place_id, presence: true
  belongs_to :place

  has_many :rooms
  has_many :reviews
end
