class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @instrument = Instrument.find(params[:id])
    @review.booking = @instrument.booking

    if @review.save
      redirect_to instrument_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :comment)
  end
end
