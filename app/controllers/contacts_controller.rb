class ContactsController < ApplicationController
  def index
    @contact = Contact.all
  end
  def done

  end
  def new
    # car = Contact.find(params[:room_id])
    #
    # session[:room_id]=car.id
    #bar = Hotel.find(params[:hotel_id])

    # session[:hotel_id]=bar.id
    @contact= Contact.new



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
    @contact = Contact.find(params[:id])
  end

  def create
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "create a"
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$'
    @contact = Contact.new(contact_params)
    # @contact.room_id = session[:room_id]


    #order = current_user.orders.build(order_params)

    # @contact.user_id = current_user.id

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_done_path(booking_id: @contact), notice: "Your message has been sent" }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :age, :contact_no, :email_id, :destination, :message)
  end
end
