class AddPaymentStatusToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :payment_status, :integer,default: 0
  end
end
