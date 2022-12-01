class PackageDetailsController < ApplicationController
  def index
    @package =Package.find(params[:package_id])
    # @place=Place.find_by_id(params[:place_id])
    # @packages=@place.packages
  end
  def filter
    @package =Package.find(params[:package_id])
  end


end
