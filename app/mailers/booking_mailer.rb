class BookingMailer < ApplicationMailer

  def booking_email(customer, host, booking_id)
    @customer = customer
    @host = host
    @booking = Booking.find(booking_id)
    mail(to: @host.email, subject: 'Someone has made a booking on your listing!')
  end
end
