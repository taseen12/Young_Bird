class RemoveRoomFromPackages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :packages, :room, index: true, foreign_key: true

  end
end
