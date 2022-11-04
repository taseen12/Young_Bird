class AddRoomToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :room, null: true, foreign_key: true
  end
end
