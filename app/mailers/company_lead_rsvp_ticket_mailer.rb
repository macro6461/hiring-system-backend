class CompanyLeadRsvpTicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_lead_rsvp_ticket_mailer.company_lead_rsvp_ticket.subject
  #
  def company_lead_rsvp_ticket(ticket)
  
    @company_lead_rsvp_ticket = ticket
    @company_lead = @company_lead_rsvp_ticket.company_lead[0]
    @event = @company_lead_rsvp_ticket.event[0]
    mail to: @company_lead.email_address,
         subject: "#{@company_lead.first_name}'s RSVP ticket for the #{@event.title}"
  end
end
