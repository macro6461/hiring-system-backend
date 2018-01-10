class Event < ApplicationRecord
  # scope :active, -> { where('end_date >= :twelve_hours_ago', twelve_hours_ago: Time.now - 12.hours) }

  has_many :company_lead_rsvps
  has_many :trainer_lead_rsvps
  has_many :company_leads, through: :company_lead_rsvps
  has_many :trainer_leads, through: :trainer_lead_rsvps
  has_many :company_lead_rsvp_tickets, through: :company_lead_rsvps
  has_many :trainer_lead_rsvp_tickets, through: :company_lead_rsvps

end
