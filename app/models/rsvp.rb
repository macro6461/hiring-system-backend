class Rsvp < ApplicationRecord

  has_one :trainer_lead, through: :trainer_lead_rsvp
  has_one :company_lead, through: :company_lead_rsvp
  has_one :trainer, through: :trainer_lead
  has_one :rsvp_ticket


end
