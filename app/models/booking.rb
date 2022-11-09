class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def set_price
    r=  check_out_date - check_in_date
    price = room.price* r
  end
end

