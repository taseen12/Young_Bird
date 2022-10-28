class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :place_name
      t.string :img_url

      t.timestamps
    end
  end
end
