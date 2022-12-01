class BookingsController < ApplicationController
  # before_action :check_access
   before_action :set_booking, only: %i[ destroy ]
  def done

  end
  def index
    if current_user.admin?
    @booking= Booking.all
    else
      redirect_to root_path
      end
    # if session[:check_in_date]
    #       @rooms = Room.where(["check_in_date Like ?","%"+ session[:check_in_date]  +"%"])
    #
    #     else
    #       @rooms = Room.order(:room_no)
    #       end
  end
  def new
     # session[:book_id]=params[:hotel_id]
    session[:cart] = {check_in_date: params[:check_in_date],check_out_date:params[:check_out_date]}
     puts "ssssssssssssssssssssssssssssssssssssssssss"
    puts session[:cart]
     puts "ssssssssssssssssssssssssssssssssssssssssss"
    if current_user.nil?
      redirect_to user_session_path

    else

    car = Room.find(params[:room_id])

    session[:room_id]=car.id
    #bar = Hotel.find(params[:hotel_id])

    # session[:hotel_id]=bar.id

    @booking= Booking.new
    # @booking.name ="hi"
    @room = Room.find(params[:room_id])

    @booking.check_in_date = params[:check_in_date]
    @booking.check_out_date = params[:check_out_date]
    check_in_date   = params[:check_in_date]
    check_out_date = params[:check_out_date]



    @room = Room.find(params[:room_id])
      @booking.price =@room.price * (check_out_date.to_date - check_in_date.to_date)
    @booking.price =@booking.price.to_i

    end
  end
   # def total_price
   #   # checkin = Date.parse(params[:check_in_date])
   #   # checkout = Date.parse(params[:check_in_date])
   #   check_in_date = check_in_date.to_i
   #   check_out_date =check_out_date.to_i
   #   @room = Room.find(params[:room_id])
   #   (check_out_date - check_in_date) * @room.price
   #
   # end

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

    # respond_to do |format|
    #   if @booking.save
    #     format.html { redirect_to new_payment_history_path(booking_id: @booking), notice: "Order was successfully created." }
    #     format.json { render :show, status: :created, location: @booking }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @booking.errors, status: :unprocessable_entity }
    #   end
    # end
    if @booking.save
      redirect_to new_payment_history_path(booking_id: @booking), notice: "Order was successfully created."
    else
      puts "rendering"
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:name, :address, :email, :contact_no, :price, :check_in_date, :check_out_date, :payment_status)
  end
  def check_access
    # unless user_signed_in?
      if current_user.nil?
      # unless user_signed_in? && current_user.admin?

      #unless @User.admin.find_by(id: session[:user_id])

       redirect_to new_user_session_path, notice: "Please log in", alert: "You are not authorized to view this page"
      else
        redirect_to new_booking_path
    end

  end
end

