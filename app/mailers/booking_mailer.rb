class BookingMailer < ApplicationMailer

  def booking_email(customer, host, booking_id)
    @customer = customer
    @host = host
    @booking = Booking.find(booking_id)
  end
end
