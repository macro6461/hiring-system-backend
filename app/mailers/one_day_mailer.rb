class OneDayMailer < ApplicationMailer

  def one_day(lead)

    @lead = lead

    mail(to: @lead.email_address, subject: "The hiring event is tomorrow!")

  end

end
