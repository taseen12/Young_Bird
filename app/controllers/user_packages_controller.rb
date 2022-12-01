class UserPackagesController < ApplicationController
  def index
    # @packages = Package.order(:package_name)

    begin
      @place=Place.find_by_id(params[:place_id])
      @packages=@place.packages
      puts @place.inspect
    rescue
      puts "place not found"
    end

  end
  def details
    @package =Package.find(params[:package_id])


    # check_in_date = params[:check_in_date]
    # check_out_date = params[:check_out_date]
  end
  def filter
    if session[:available_rooms].present?
      @rooms = Room.where(id: session[:available_rooms])
      session[:available_rooms] = nil
    else
      @rooms = nil
    end
  end
  def filters_room

    check_in_date = params[:check_in_date]
    check_out_date = params[:check_out_date]

    # bar = Room.find(params[:room_type])
    # session[:room_type]=bar.id
    # @package.room_type = session[:room_type]
    # room_type = params[:room_type]
    # @room =Room.find(params[:room_type])
    # @room = params[:room_type]
    #
    # @package.room.room_type = session[:room_type]
    @package = Package.find(params[:package][:package_id])
     # @room = Room.find(params[:room_id])
    puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    puts @package.room_type
    puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    # @package.room.room_type=params[:room_type]
    # puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    # puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    # puts @package.room.room_type=params[:room_type]
    # puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    # puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    @rooms = Room.where(room_type: @package.room_type)
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
        booking.check_in_date < check_in_date.to_date && booking.check_out_date < check_out_date.to_date ||
          booking.check_in_date > check_in_date.to_date && booking.check_out_date >check_out_date.to_date
          # room = Room.where(room_type:2)
          available_rooms << room.id
          # available_rooms.push(room.id)
          # else
          #   available_rooms=nil
          puts "ssssssssssssssssssssssssssss"
          puts available_rooms
          puts "ssssssssssssssssssssssssssss"

          puts room.id
        end


      end
    end

    puts "////////////////"
    puts "////////////////"
    puts available_rooms


    session[:available_rooms] = available_rooms.uniq
    redirect_to user_rooms_index_path(check_in_date: params[:check_in_date],check_out_date: params[:check_out_date],room_type: params[:room_type] )
  end

end
