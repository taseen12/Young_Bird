class AddVideoUrlToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :video_url, :string
  end
end
