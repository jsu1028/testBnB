class BookingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    BookingMailer.booking_email(args[0],args[1],args[2]).deliver_now
  end
end
