class UserRoomsController < ApplicationController
  def index
    @rooms = Room.order(:room_no)
  end
end
