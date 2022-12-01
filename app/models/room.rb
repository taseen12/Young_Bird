class Room < ApplicationRecord
  validates :room_no, :no_of_bed, :room_type,:room_description, :facilities,:price,:hotel_id, :img_url, :place_id, presence: true
  belongs_to :place
  belongs_to :hotel
  has_many :bookings


  # def available?
  #   @booking.each do |booking|
  #     if
  #     booking.check_in_date > check_in_date && booking.check_out_date > check_out_date
  #       return " helloooooooooo"
  #
  #
  #     end
  #
  #   end
  # end

end
