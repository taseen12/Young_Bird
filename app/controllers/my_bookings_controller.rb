class MyBookingsController < ApplicationController
   before_action :check_access
  def index

    #@user = User.includes(:orders).find(params[:user_id])
    @bookings = current_user.bookings


    @user=User.find(current_user.id)
    # if user = User.authenticate(params[:email], params[:password])
    #   session[:user_id] = user.id
    #   flash[:notice] = "Welcome back, #{user.name}!"
    #   redirect_to(session[:intended_url] || user)
    #   session[:intended_url] = nil
    # else
    #   flash.now[:alert] = "Invalid email/password combination!"
    #   render :new
    # end


  end
  #def set_user
  # @user = User.find(params[:id])
  #puts session[:user_id]
  # @user = User.find_by_id(session[:user_id])

  #end
  private
  def check_access
    unless user_signed_in?
      # unless user_signed_in? && current_user.admin?
      # session[:intended_url] = request.url
      #unless @User.admin.find_by(id: session[:user_id])
      redirect_to new_user_session_path, notice: "Please log in", alert: "You are not authorized to view this page"
    end

  end
end
