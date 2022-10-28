class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.string :no_of_bed
      t.integer :room_type
      t.string :room_description
      t.string :facilities
      t.decimal :price
      t.string :img_url
      t.references :place, null: false, foreign_key: true
      t.belongs_to :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
