class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_type
      t.string :location
      t.string :img_url
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
