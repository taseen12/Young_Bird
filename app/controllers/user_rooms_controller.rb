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

    if params[:hotel_id].present?
      session[:hotel_id] = params[:hotel_id]
    end
    @hotel_id=session[:hotel_id]

  end
  def filter_room


    check_in_date = params[:check_in_date]
    check_out_date = params[:check_out_date]


    @rooms = Room.where(hotel_id: params[:hotel][:hotel_id])
    available_rooms =[]


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

    session[:available_rooms] = available_rooms.uniq
    redirect_to user_rooms_index_path(check_in_date: params[:check_in_date],check_out_date: params[:check_out_date],hotel_id: params[:hotel_id])
  end
  def min_max
    check_in_date = params[:check_in_date]
    check_out_date = params[:check_out_date]

    min = params[:min]
    max = params[:max]
    @rooms = Room.where('hotel_id = ? && price>=? && price<=?',params[:hotel][:hotel_id],min.to_i,max.to_i)
    available_rooms =[]
    @rooms.each do |room|
      available_rooms << room.id
    end


    session[:available_rooms] = available_rooms

    redirect_to user_rooms_index_path(min: params[:min],max: params[:max],hotel_id: params[:hotel_id],check_in_date: params[:check_in_date],check_out_date: params[:check_out_date])

    end

  end