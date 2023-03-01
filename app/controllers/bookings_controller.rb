class BookingsController < ApplicationController
  def create
    @user = current_user
    @booking = Booking.new(params_booking)
    @booking.user = @user
    break
    @instrument = Instrument.find(params[:])

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to instrument_path, status: :unprocessable_entity
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
    params.require(:booking).permit(:start, :end)
  end
end
