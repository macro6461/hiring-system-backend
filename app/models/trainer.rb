class Trainer < ApplicationRecord

  has_many :trainer_leads
  has_many :interviews, through: :trainer_leads
  has_many :rsvps, through: :trainer_leads

end
