class TrainerLeadRsvpTicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_lead_rsvp_ticket_mailer.company_lead_rsvp_ticket.subject
  #
  def trainer_lead_rsvp_ticket(ticket)
    
    @trainer_lead_rsvp_ticket = ticket
    @trainer_lead = @trainer_lead_rsvp_ticket.trainer_lead[0]
    @event = @trainer_lead_rsvp_ticket.event[0]
    mail to: @trainer_lead.email_address,
         subject: "#{@trainer_lead.first_name}'s RSVP ticket for the #{@event.title}"
  end

end
