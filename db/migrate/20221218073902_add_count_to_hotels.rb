class AddCountToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :count, :integer, :default => 1
  end
end
