class UserPackagesController < ApplicationController
  def index
    @packages = Package.order(:package_name)
  end
end
