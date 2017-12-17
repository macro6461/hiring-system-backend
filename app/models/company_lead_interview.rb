class CompanyLeadInterview < ApplicationRecord

  # belongs_to :trainer
  belongs_to :company_lead


  after_save :update_company_lead, :update_trainer, :check_leads

  def trainer
    if self.trainer_id == nil
      "no trainer assigned"
    else
      company_lead_interview_trainer = Trainer.all.find(self.trainer_id)
    end
  end

  def update_trainer
    if self.trainer_id == nil
      "no trainer assigned"
    else
      is_hired = self.hire
      company_lead_interview_trainer = Trainer.all.find(self.trainer_id)
      if is_hired == "N/A"
        byebug
        company_lead_interview_trainer.update(occupied: true)
        # return company_lead_interview_trainer
      elsif is_hired == "yes"
        byebug
        company_lead_interview_trainer.update(occupied: false)
        self.update(trainer_id: nil)
        # return company_lead_interview_trainer
      elsif is_hired == "no"
        byebug
        company_lead_interview_trainer.update(occupied: false)
        self.update(trainer_id: nil)
        # return company_lead_interview_trainer
      end
    end
  end

  def update_company_lead
    if self.hire == "N/A"
      "N/A"
    elsif self.hire.downcase == "yes"
      # self.update(trainer_id: nil)
      self.company_lead.update(hire: "yes")
    elsif self.hire.downcase == "no"
      # self.update(trainer_id: nil)
      self.company_lead.update(hire: "no")
    end
  end

  def check_leads
    byebug
    Trainer.all.map do |trainer|
      if trainer.trainer_lead_interviews.length == 0 && trainer.company_lead_interviews.length == 0 && trainer.occupied == false
        trainer
      elsif trainer.trainer_lead_interviews.length > 0 || trainer.company_lead_interviews.length > 0 && trainer.occupied == true
        trainer
      elsif trainer.trainer_lead_interviews.length == 0 && trainer.company_lead_interviews.length == 0 && trainer.occupied == true
        byebug
        trainer.update(occupied: false)
      elsif trainer.trainer_lead_interviews.length > 0 || trainer.company_lead_interviews.length > 0 && trainer.occupied == false
        byebug
        trainer.update(occupied: true)
      end
    end
  end


end
