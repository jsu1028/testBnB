class BookingsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.listing = @listing
    if @booking.save
      BookingMailer.booking_email(current_user,@listing.user,@booking.id).deliver_now

      BookingJob.perform_later(current_user,@listing.user,@booking.id)
      flash[:success] = "Successful - booking saved!"
      redirect_to current_user
    else
      @errors = @booking.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.user
  end

  def booking_params
    params.require(:booking).permit(:num_guests, :start_date, :end_date, :price)
  end
end
