class CompanyLeadInterview < ApplicationRecord

  # belongs_to :trainer
  belongs_to :company_lead


  after_save :update_company_lead, :update_trainer

  def trainer
    if self.trainer_id == nil
      return "no trainer assigned"
    else
      company_lead_interview_trainer = Trainer.all.find(self.trainer_id)
    end
  end

  def update_trainer
    byebug
    if self.trainer_id == nil
      return "no trainer assigned"
    else
      is_hired = self.hire
      company_lead_interview_trainer = Trainer.all.find(self.trainer_id)
      if is_hired == "N/A"
        byebug
        company_lead_interview_trainer.update(occupied: true)
        # return company_lead_interview_trainer
      elsif is_hired == "yes"
        company_lead_interview_trainer.update(occupied: false)
        # return company_lead_interview_trainer
      elsif is_hired == "no"
        company_lead_interview_trainer.update(occupied: false)
        # return company_lead_interview_trainer
      end
    end
  end

  def update_company_lead
    if self.hire == "N/A"
      return "N/A"
    elsif self.hire.downcase == "yes"
      byebug
      # self.update(trainer_id: nil)
      return self.company_lead.update(hire: "yes")
    elsif self.hire.downcase == "no"
      byebug
      # self.update(trainer_id: nil)
      return self.company_lead.update(hire: "no")
    end
  end


end
