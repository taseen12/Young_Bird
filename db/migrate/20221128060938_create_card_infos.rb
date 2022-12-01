class CreateCardInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :card_infos do |t|
      t.string :card_number
      t.string :pincode_digest
      t.date :expiration

      t.timestamps
    end
  end
end
