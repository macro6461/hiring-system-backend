class Interview < ApplicationRecord

  has_one :trainer_lead, through: :trainer_lead_interview
  has_one :company_lead, through: :company_lead_interview
  has_one :trainer, through: :trainer_lead_interview

end
