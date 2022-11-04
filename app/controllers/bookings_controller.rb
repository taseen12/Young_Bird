class BookingsController < ApplicationController
  def done

  end
  def index
    @booking= Booking.all
  end
  def new
    car = Room.find(params[:room_id])

    session[:room_id]=car.id
    #bar = Hotel.find(params[:hotel_id])

    # session[:hotel_id]=bar.id
    @booking= Booking.new

  end
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "create a"
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$'
    @booking = Booking.new(booking_params)
    @booking.room_id = session[:room_id]


    #order = current_user.orders.build(order_params)

    @booking.user_id = current_user.id

    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_done_url, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:name, :address, :email, :contact_no, :check_in_date, :check_out_date)
  end
end

