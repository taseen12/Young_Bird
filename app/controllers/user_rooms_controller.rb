class UserRoomsController < ApplicationController
  require 'date'

  def index


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


      @rooms = Room.all
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
    redirect_to user_rooms_index_path(check_in_date: params[:check_in_date],check_out_date: params[:check_out_date])
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