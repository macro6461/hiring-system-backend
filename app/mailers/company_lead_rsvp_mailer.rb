class CompanyLeadRsvpMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_lead_rsvp_mailer.company_lead_rsvp.subject
  #
  def company_lead_rsvp(company_lead_rsvp)
    @company_lead_rsvp = company_lead_rsvp
    
    mail to: "to@example.org"
  end
end
