class ChangePriceToBeIntegerInRooms < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :price, :integer
  end
end
