class CompanyLeadInterviewMailer < ApplicationMailer

  default from: 'noreply@bohemiarealtygroup.com'
  add_template_helper(CompanyLeadInterviewsHelper)

  def company_lead_interview(company_lead_interview)

    byebug
    @company_lead_interview = company_lead_interview
    @company_lead = @company_lead_interview.company_lead
    @trainer = @company_lead_interview.trainer
    byebug
    mail(:to => @company_lead.email_address, :subject => "TEST")


  end


end
