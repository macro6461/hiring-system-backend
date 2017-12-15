class TrainerLeadInterview < ApplicationRecord

  # belongs_to :trainer
  belongs_to :trainer_lead

  def trainer
    if self.trainer_id == nil
      return "not trainer assigned"
    else
      trainer_lead_interview_trainer = Trainer.all.find(self.trainer_id)
      trainer_lead_interview_trainer.update(occupied: true)
      return trainer_lead_interview_trainer
    end
  end

end
