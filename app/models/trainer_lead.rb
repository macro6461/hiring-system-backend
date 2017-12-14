class TrainerLead < ApplicationRecord

  belongs_to :trainer
  has_many :trainer_lead_rsvps
  has_many :trainer_lead_rsvp_tickets, through: :trainer_lead_rsvps
  has_many :events, through: :trainer_lead_rsvps
  has_many :trainer_lead_interviews


end
