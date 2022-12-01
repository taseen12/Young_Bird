class PaymentHistory < ApplicationRecord
  # has_one :user
  # validates :pay_type, inclusion: pay_type.keys
  # validates :pincode_digest, presence: true

  # validates :card_number, presence: true
  # def card_number_check
  #   @card_infos= CardInfo.find_by(card_number: card_number)
  #   unless card_number == @card_infos.card_number
  #     errors.add(:card_number, "Must be equal to the price to process further!")
  #   end
  # end
  enum pay_type: {
    "bkash" => 0,
    "credit card" => 1,

  }
  belongs_to :booking

end
