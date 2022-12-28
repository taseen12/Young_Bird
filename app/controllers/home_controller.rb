class HomeController < ApplicationController
  #before_action :check_access
  def index
    @hotels=Hotel.order(count: :DESC).limit(3)
    @hotel=Hotel.order(rating: :DESC).limit(3)
    # @places= Place.(count: )
    # @hotels=Hotel.all
  end
  private
  def check_access
    #unless current_user.admin?
    unless user_signed_in? && current_user.admin?
      #unless @User.admin.find_by(id: session[:user_id])
      redirect_to new_user_session_path, alert: "You are not authorized to view this page"
      end
    end
end
