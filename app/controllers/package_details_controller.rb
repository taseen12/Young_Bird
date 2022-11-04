class PackageDetailsController < ApplicationController
  def index
    @package =Package.find(params[:package_id])
  end
end
