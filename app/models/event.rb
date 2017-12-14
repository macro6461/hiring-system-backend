class Event < ApplicationRecord

  has_many :company_lead_rsvps
  has_many :trainer_lead_rsvps
  has_many :company_leads, through: :company_lead_rsvps
  has_many :trainer_leads, through: :trainer_lead_rsvps
  has_many :company_lead_rsvp_tickets, through: :company_lead_rsvps
  has_many :trainer_lead_rsvp_tickets, through: :company_lead_rsvps

end
