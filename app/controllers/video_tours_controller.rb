class VideoToursController < ApplicationController
  def index
    @places = Place.all
  end
  def details
    @place=Place.find_by_id(params[:place_id])
  end
end
