class AddRatingToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :rating, :integer
  end
end
