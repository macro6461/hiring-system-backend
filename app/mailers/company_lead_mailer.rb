class CompanyLeadMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def welcome_email
    byebug
    @company_lead = params[:company_lead]
    @url  = 'http://www.bohemiarealtygroup.com/'
    mail(to: @company_lead.email_address, subject: 'Welcome to Bohemia Mailing List')
  end

end
