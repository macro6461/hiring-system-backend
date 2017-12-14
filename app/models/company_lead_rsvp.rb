class CompanyLeadRsvp < ApplicationRecord

  belongs_to :event
  has_one :company_lead

end
