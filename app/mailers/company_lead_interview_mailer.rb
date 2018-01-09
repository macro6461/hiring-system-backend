class CompanyLeadInterviewMailer < ApplicationMailer

  default from: 'noreply@bohemiarealtygroup.com'
  include CompanyLeadInterviewsHelper
  add_template_helper(CompanyLeadInterviewsHelper)

  def company_lead_interview(company_lead_interview)


    @company_lead_interview = company_lead_interview
    @company_lead = @company_lead_interview.company_lead
    @trainer = @company_lead_interview.trainer
    @full_name = full_name(@trainer)

    mail(:to => @company_lead.email_address, :subject => "#{@company_lead.first_name}'s Interview With #{@full_name}")


  end


end
