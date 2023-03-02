class BookingsController < ApplicationController
  def create
    @user = current_user
    @booking = Booking.new(params_booking)
    @booking.user = @user
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to instrument_path(@instrument), status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = @booking.user
    @instrument = @booking.instrument
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  private

  def params_booking
    params.require(:booking).permit(:start, :end, :instrument_id)
  end
end
