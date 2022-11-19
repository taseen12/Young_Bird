class Booking < ApplicationRecord
  enum payment_status: {
    "unpaid" => 0,
    "paid" => 1,
    "credit card" => 2
  }
  belongs_to :user
  belongs_to :room
  has_many :payment_history


end

