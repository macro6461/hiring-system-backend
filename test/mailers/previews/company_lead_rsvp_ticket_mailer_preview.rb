# Preview all emails at http://localhost:3000/rails/mailers/company_lead_rsvp_ticket_mailer
class CompanyLeadRsvpTicketMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/company_lead_rsvp_ticket_mailer/company_lead_rsvp_ticket
  def company_lead_rsvp_ticket
    ticket = CompanyLeadRsvpTicket.last
    CompanyLeadRsvpTicketMailer.company_lead_rsvp_ticket(ticket)
  end

end
