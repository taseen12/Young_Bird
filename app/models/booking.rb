class Booking < ApplicationRecord
   validates :name, :address, :contact_no, :email, :check_in_date, :check_out_date, presence: true
  validates :contact_no,   :presence => {:message => 'hello world, bad operation!'},
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  enum payment_status: {
    "unpaid" => 0,
    "paid" => 1,

  }
  belongs_to :user
  belongs_to :room
  has_one :payment_history

   # def paid_and_unpaid
   #   @booking = Booking.find(params[:booking_id])
   #   @booking.payment_history= PaymentHistory.find(params[:payment_history_id])
   #   if @booking.payment_histories_is_complete
   #     booking.payment_status = 1
   #   end
   # end
end

