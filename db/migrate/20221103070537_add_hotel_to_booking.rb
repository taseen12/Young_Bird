class AddHotelToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :hotel, null: true, foreign_key: true
  end
end
