class Trainer < ApplicationRecord

  has_many :trainer_lead_interviews
  has_many :company_lead_interviews
  has_many :trainer_leads
  has_many :interview_references
  has_many :rsvp_references 
  # after_save :order_trainers
  #
  # def order_trainers
  #   Trainer.all.sort_by(&:updated_at)
  # end


end
