class Trainer < ApplicationRecord

  has_many :trainer_lead_interviews
  has_many :company_lead_interviews
  has_many :trainer_leads

  after_save :order_trainers

  def order_trainers
    Trainer.all.sort_by(&:updated_at)
  end
  #

  # def check_trainer
  #   if self.trainer_lead_interviews.length == 0 && self.company_lead_interviews.length == 0 && self.occupied == true
  #
  #     self.update(occupied: false)
  #   elsif self.trainer_lead_interviews.length == 0 && self.company_lead_interviews.length == 0 && self.occupied == false
  #
  #     return self
  #   elsif self.trainer_lead_interviews.length > 0 || self.company_lead_interviews.length > 0 && self.occupied == false
  #
  #     self.update(occupied: true)
  #   elsif self.trainer_lead_interviews.length > 0 || self.company_lead_interviews.length > 0 && self.occupied == true
  #
  #     return self
  #   end
  # end
  # def filter_trainers
  #   filtered_trainers = Trainer.all.where(:occupied => false, :hold=> false)
  #   filtered_trainers.sort_by(&:updated_at)
  # end

end
