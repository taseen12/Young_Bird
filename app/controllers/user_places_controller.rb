class UserPlacesController < ApplicationController
  def index
    if session[:q]
      puts "////////////////"
      puts "////////////////"
      @places = Place.where(["place_name Like ?","%"+session[:q]+"%"])
          session[:q]=nil
        else
          # @places = Place.order(:place_name)
          @places = Place.all
        end
   end
  def search
    session[:q] = params[:q]
    redirect_to user_place_index_path



  end
  end

# def index
#   if session[:q]
#     @places = Place.where(["place_name Like ?","%"+session[:q]+"%"])
#   else
#     @places = Place.order(:place_name)
#   end
# end
# def search
#
#   session[:q] = params[:q]
#   redirect_to places_path
# end
#end