class CompanyLeadInterview < ApplicationRecord

  # belongs_to :trainer
  belongs_to :company_lead

  def trainer
    if self.trainer_id == nil
      return "no trainer assigned"
    else
      is_hired = self.hired
      company_lead_interview_trainer = Trainer.all.find(self.trainer_id)
      if is_hired == "N/A"
        byebug
        company_lead_interview_trainer.update(occupied: true)
        return company_lead_interview_trainer
      elsif is_hired == "yes"
        company_lead_interview_trainer.update(occupied: false)
        return company_lead_interview_trainer
      elsif is_hired == "no"
        company_lead_interview_trainer.update(occupied: false)
        return company_lead_interview_trainer
      end
    end
  end

  def hired
    byebug
    if self.hire == "N/A"
      return "N/A"
    elsif self.hire == "yes"
      byebug
      self.company_lead.update(hire: "yes")
      byebug
      return self.hire
    elsif self.company_lead.hire == "no"
      byebug
      self.company_lead.update(hire: "no")
      return self.hire
    end
  end

end
