class PaymentHistoriesController < ApplicationController

    before_action :set_payment_history, only: %i[ show edit update destroy ]

    # GET /payment_histories or /payment_histories.json
    def index
      @payment_histories = PaymentHistory.all
    end

    # GET /payment_histories/1 or /payment_histories/1.json
    def show
    end

    # GET /payment_histories/new
    def new
      book = Booking.find(params[:booking_id])

      session[:booking_id]=book.id
      @payment_history = PaymentHistory.new
      @booking = Booking.find(params[:booking_id])
      # @payment_history.pincode_digest = 345
      #  @payment_history.pay_type = "bkash"
      # @payment_history.amount = @Booking.price
    end

    # GET /payment_histories/1/edit
    def edit
    end

    # POST /payment_histories or /payment_histories.json
    def create
      @payment_history = PaymentHistory.new(payment_history_params)
      @payment_history.booking_id = session[:booking_id]

      respond_to do |format|
        if @payment_history.save
          format.html { redirect_to payment_histories_done_url, notice: "Payment was successfully created." }
          format.json { render :show, status: :created, location: @payment_history }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @payment_history.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /payment_histories/1 or /payment_histories/1.json
    # def update
    #   respond_to do |format|
    #     if @payment_history.update(payment_history_params)
    #       format.html { redirect_to payment_histories_done_path(@payment_history), notice: "Payment was successfully updated." }
    #       format.json { render :show, status: :ok, location: @payment_history }
    #     else
    #       format.html { render :edit, status: :unprocessable_entity }
    #       format.json { render json: @payment_history.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # DELETE /payment_histories/1 or /payment_histories/1.json
    # def destroy
    #   @payment_history.destroy
    #
    #   respond_to do |format|
    #     format.html { redirect_to payment_histories_url, notice: "Payment history was successfully destroyed." }
    #     format.json { head :no_content }
    #   end
    # end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_history
      @payment_history = PaymentHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_history_params
      params.require(:payment_history).permit(:card_number, :pincode_digest, :expiration, :amount, :mobile_no, :pay_type)
    end
  end
