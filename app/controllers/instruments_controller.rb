class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
    @review = Review.new

    if current_user.bookings.find_by(instrument_id: params[:id]).nil?
      @reviews = []
    else
      @reviews = current_user.bookings.find_by(instrument_id: params[:id]).reviews.order(created_at: :desc)
    end
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @user = current_user
    @instrument = Instrument.new(params_instrument)
    @instrument.user = @user

    if @instrument.save
      # redirect_to instrument_path(@instrument)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_instrument
    params.require(:instrument).permit(:name, :description, :price, :photo)
  end
end
