class CompanyLeadRsvpTicket < ApplicationRecord

  belongs_to :company_lead_rsvp
  has_many :company_lead, through: :company_lead_rsvp
  has_many :event, through: :company_lead_rsvp

  has_one_time_password

end