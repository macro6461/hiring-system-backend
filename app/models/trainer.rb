class Trainer < ApplicationRecord

  has_many :trainer_lead_interviews
  has_many :company_lead_interviews
  has_many :trainer_leads

end
