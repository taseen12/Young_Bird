class UserHotelsController < ApplicationController
  def index
    @hotels = Hotel.order(:hotel_name)
  end
end
