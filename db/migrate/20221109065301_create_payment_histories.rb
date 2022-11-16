class CreatePaymentHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_histories do |t|
      t.string :card_number
      t.string :pincode_digest
      t.date :expiration
      t.decimal :amount
      t.string :mobile_no
      t.integer :pay_type

      t.timestamps
    end
  end
end
