class CompanyLeadMailer < ApplicationMailer

  default from: 'noreply@bohemiarealtygroup.com'

  def welcome_email(company_lead)
    @company_lead = company_lead
    @url  = 'http://www.bohemiarealtygroup.com/'
    mail(to: @company_lead.email_address, subject: 'Welcome to Bohemia Mailing List')
  end

end
