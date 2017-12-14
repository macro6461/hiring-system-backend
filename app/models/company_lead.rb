class CompanyLead < ApplicationRecord

  has_one :company_lead_rsvp
  has_one :company_lead_interview

end
