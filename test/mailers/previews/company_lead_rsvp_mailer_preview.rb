# Preview all emails at http://localhost:3000/rails/mailers/company_lead_rsvp_mailer
class CompanyLeadRsvpMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/company_lead_rsvp_mailer/company_lead_rsvp
  def company_lead_rsvp
    CompanyLeadRsvpMailer.company_lead_rsvp
  end

end
