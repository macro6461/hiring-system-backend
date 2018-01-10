class ThankYouMailer < ApplicationMailer

  def thank_you(attendee)
    
    @attendee = attendee

    mail(to: @attendee.email_address, subject: "Thank you for coming to our event.")

  end

end
