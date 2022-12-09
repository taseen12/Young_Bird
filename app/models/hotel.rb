class Hotel < ApplicationRecord
  validates :hotel_name, :hotel_type, :location, :img_url, :place_id, presence: true
  belongs_to :place

  has_many :rooms
  has_many :reviews

  def set_rating
    number_of_reviews = reviews.count
    total_rating = 0
    current_hotel_rating = nil
    if number_of_reviews > 0
      reviews.each do |review|
        total_rating += review.rating
      end
      current_hotel_rating = total_rating.to_f/number_of_reviews.to_f
    end

    location
    self.rating = current_hotel_rating.to_f
    save!
  end
end
