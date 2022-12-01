class UserHotelsController < ApplicationController
  def index
    @hotels = Hotel.order(:hotel_name)
    # @place=Place.find_by_id(params[:place_id])
    # @packages=@place.packages
  end
end
