class PlacesController < ApplicationController
  before_action :check_access
  before_action :set_place, only: %i[ show edit update destroy ]

  # GET /places or /places.json

  def index
  #  if session[:q]
  #    @places = Place.where(["place_name Like ?","%"+session[:q]+"%"])
  # else
   @places = Place.all
  end
  #  end
  # def search
  #
  #  session[:q] = params[:q]
  # redirect_to places_path
  # end
  # # def index
  #
  #     @place = Place.all
  #
  # end
  # def search
  #   #@places = Place.where("place_name LIKE ?","%"+params[:q]+"%")
  #   @places = Place.where(["place_name Like ?","%#{params[:q]}%"])
  # end

  # GET /places/1 or /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places or /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to place_url(@place), notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to place_url(@place), notice: "Place was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1 or /places/1.json
  def destroy
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:place_name, :img_url, :video_url)
    end
  def check_access
    #unless current_user.admin?
    unless user_signed_in? && current_user.admin?
      #unless @User.admin.find_by(id: session[:user_id])
      redirect_to new_user_session_path, alert: "You are not authorized to view this page"
    end
  end
end
