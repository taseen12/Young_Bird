class Room < ApplicationRecord
  belongs_to :place
  belongs_to :hotel

  def available_rooms
    puts"sssssssssssssssssssssssss"
    @room = Room.all
    puts"sssssssssssssssssssssssss"
  end
end
