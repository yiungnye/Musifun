class ReviewsController < ApplicationController
  def create
    @review = Review.new(params_review)
    @instrument = Instrument.find(params[:instrument_id])
    @review.booking = current_user.bookings.find_by(instrument_id: params[:instrument_id])

    if @review.save
      redirect_to instrument_path(@instrument)
    else
      redirect_to instrument_path(@instrument), status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :comment)
  end
end
