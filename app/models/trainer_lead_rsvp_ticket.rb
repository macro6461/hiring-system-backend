class TrainerLeadRsvpTicket < ApplicationRecord

  belongs_to :trainer_lead_rsvp
  has_many :trainer_lead, through: :trainer_lead_rsvp
  has_many :event, through: :trainer_lead_rsvp

  has_one_time_password

end
