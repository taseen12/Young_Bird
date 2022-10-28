class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.integer :package_no
      t.string :package_name
      t.string :pack_description
      t.string :facilities
      t.decimal :price
      t.string :img_url
      t.references :place, null: false, foreign_key: true
      t.belongs_to :hotel, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
