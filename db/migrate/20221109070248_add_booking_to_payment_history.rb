class AddBookingToPaymentHistory < ActiveRecord::Migration[6.0]
  def change
    add_reference :payment_histories, :booking, null: true, foreign_key: true
  end
end
