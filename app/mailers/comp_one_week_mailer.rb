class CompOneWeekMailer < ApplicationMailer

  def comp_one_week(ticket)

    @ticket = ticket
    @lead = ticket.company_lead[0]

    mail(to: @lead.email_address, subject: "The hiring event is tomorrow!")

  end


end
