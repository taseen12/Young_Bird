class AddRoomTypeToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :room_type, :integer, default: 1
  end
end
