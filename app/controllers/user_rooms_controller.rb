class UserRoomsController < ApplicationController
  require 'date'

  def index

    # @room.id=params[:room_id]
    # @rooms.price=params[:price]
      if session[:available_rooms].present?
        @rooms = Room.where(id: session[:available_rooms])
        session[:available_rooms] = nil
      else
        @rooms = nil
      end
  end
  def filter_room


    check_in_date = params[:check_in_date]
    check_out_date = params[:check_out_date]

     # @hotel = Hotel.find(params[:hotel][:hotel_id])
     # @rooms = Room.find(params[:room_id])
     #   @rooms = Room.where(hotel_id: @room.hotel_id)
    # @rooms=Room.where(hotel_id:2)
    # @rooms= Room.all
       @rooms = Room.where(hotel_id: params[:hotel][:hotel_id])
      available_rooms =[]


    # # check_in_date=Date.parse(check_in_date)
    # # check_out_date=Date.parse(check_out_date)
    # puts "Check in"
    # puts check_in_date
    # puts check_out_date

    @rooms.each do |room|
      if room.bookings.count == 0

        available_rooms << room.id
      end


    room.bookings.each do |booking|
      # @booking.each do |booking|

      if
      booking.check_in_date > check_in_date.to_date && booking.check_in_date > check_out_date.to_date ||
        booking.check_out_date < check_in_date.to_date && booking.check_out_date <check_out_date.to_date

        available_rooms << room.id

                 puts "ssssssssssssssssssssssssssssssss"
                 puts "ssssssssssssssssssssssssssssssss"
                 puts available_rooms
                 puts "ssssssssssssssssssssssssssssssss"
                 puts "ssssssssssssssssssssssssssssssss"
                # available_rooms.push(room.id)
            # else
            #   available_rooms=nil

      end



      end
    end

    puts "////////////////"
    puts "////////////////"
    puts available_rooms


    session[:available_rooms] = available_rooms.uniq
    redirect_to user_rooms_index_path(check_in_date: params[:check_in_date],check_out_date: params[:check_out_date],hotel_id: params[:hotel_id])
    end

  # def filter_room
  #   session[:check_in_date] = params[:check_in_date]
  #   puts "ssssssssssssssssssssssssss"
  #   puts session[:check_in_date]
  #   puts params[:check_in_date]
  #   puts "ssssssssssssssssssssssssss"
  #   session[:check_out_date] = params[:check_out_date]
  #   puts "aaaaaaaaaaaaaaaaaaaaaaaa"
  #   puts session[:check_out_date]
  #   puts params[:check_out_date]
  #   puts "aaaaaaaaaaaaaaaaaaaaaaaa"
  #
  #   redirect_to user_rooms_index_path
  #   end
  end