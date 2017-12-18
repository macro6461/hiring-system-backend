# Preview all emails at http://localhost:3000/rails/mailers/company_lead_mailer
class CompanyLeadMailerPreview < ActionMailer::Preview

    def welcome_email
      company_lead = CompanyLead.last
      CompanyLeadMailer.welcome_email(company_lead)
    end

end
