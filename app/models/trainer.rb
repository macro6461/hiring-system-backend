class Trainer < ApplicationRecord

  has_many :trainer_lead_interviews
  has_many :company_lead_interviews
  has_many :trainer_leads

  # after_save :order_trainers
  #
  # def order_trainers
  #   Trainer.all.sort_by(&:updated_at)
  # end


end
