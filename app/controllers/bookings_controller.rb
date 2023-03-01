class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(params_booking)
    @booking.user = @user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = @booking.user
    @instrument = @booking.instrument
  end
end
