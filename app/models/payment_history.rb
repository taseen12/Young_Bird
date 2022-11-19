class PaymentHistory < ApplicationRecord
  # validates :pay_type, inclusion: pay_type.keys
  enum pay_type: {
    "bkash" => 0,
    "credit card" => 1,

  }
  belongs_to :booking

end
