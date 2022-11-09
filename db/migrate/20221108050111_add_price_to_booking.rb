class AddPriceToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :price, :decimal, default: 0
  end
end
