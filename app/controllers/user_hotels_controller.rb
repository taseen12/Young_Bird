class UserHotelsController < ApplicationController
  def index
    @hotels = Hotel.order(:hotel_name)
    # @place=Place.find_by_id(params[:place_id])
    # @packages=@place.packages
  end

  def set_hotel_rating

    hotel = Hotel.find_by_id(params[:hotel_id])
    user = User.find_by_id(params[:user_id])

    # @place=Place.find_by_id(params[:place_id])
    # @packages=@place.packages
    ratting = params[:ratting]
    messsage = params[:messsage]
    hotel=params[:hotel][:hotel_id]
    user= current_user.id
    @review = Review.new(:rating => ratting,:message =>messsage,:hotel_id => hotel,:user_id=> user)
    puts @review
    puts @review.valid?

    if(@review.save)
      redirect_to user_hotels_details_path(hotel_id: hotel), notice: "created"
    else
      redirect_to user_hotels_details_path(hotel_id: hotel), notice: "not created"
    end
  end
  def details
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.all

  end
end
