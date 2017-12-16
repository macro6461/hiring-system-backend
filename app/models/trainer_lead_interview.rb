class TrainerLeadInterview < ApplicationRecord

  # belongs_to :trainer
  belongs_to :trainer_lead

  after_save :update_trainer_lead_interview_trainer_id, :update_trainer_lead_hire, :update_trainer

  def trainer
    if self.trainer_id == nil
      return "no trainer assigned"
    else
      trainer_lead_interview_trainer = Trainer.all.find(self.trainer_id)
    end
  end


  def update_trainer
    if self.trainer_id == nil
      return "no trainer assigned"
    else
      byebug
      is_hired = self.hire
      trainer_lead_interview_trainer = Trainer.all.find(self.trainer_id)
      if is_hired == "N/A"
        trainer_lead_interview_trainer.update(occupied: true)
        # return trainer_lead_interview_trainer
      elsif is_hired == "yes"
        trainer_lead_interview_trainer.update(occupied: false)
        # return trainer_lead_interview_trainer
      elsif is_hired == "no"
        trainer_lead_interview_trainer.update(occupied: false)
        # return trainer_lead_interview_trainer
      end
    end
  end


  def update_trainer_lead_interview_trainer_id
    if self.trainer_id
      byebug
      return self.trainer_lead.update(interview_trainer_id: self.trainer_id)
    end
  end


  def update_trainer_lead_hire
    if self.hire == "N/A"
      return "N/A"
    elsif self.hire.downcase == "yes"
      # self.update(trainer_id: nil)
      self.trainer_lead.update(hire: "yes")
    elsif self.hire.downcase == "no"

      # self.update(trainer_id: nil)
      return self.trainer_lead.update(hire: "no")
    end

  end


end
