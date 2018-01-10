class OneWeekMailer < ApplicationMailer

  def one_week(lead)

    @lead = lead

    mail(to: @lead.email_address, subject: "The hiring event is tomorrow!")

  end


end
