class TrainerLead < ApplicationRecord

  has_one :trainer_lead_rsvp
  has_one :trainer_lead_interview
  has_one :trainer

end
