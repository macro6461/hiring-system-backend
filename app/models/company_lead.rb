class CompanyLead < ApplicationRecord
  
  has_many :company_lead_rsvps
  has_many :events, through: :company_lead_rsvps
  has_many :company_lead_rsvp_tickets, through: :company_lead_rsvps
  has_many :interviews, through: :company_lead_interviews

end
