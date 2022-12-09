class Review < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  after_save :set_hotel_rating
  def set_hotel_rating
    hotel.set_rating
  end
end
