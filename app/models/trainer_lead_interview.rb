class TrainerLeadInterview < ApplicationRecord

  belongs_to :trainer_lead
  belongs_to :trainer
  # after_save :update_trainer_lead_hire, :update_interview_trainer

#   def update_interview_trainer
#     if self.trainer_id == nil
#       "no trainer assigned"
#     else
#       is_hired = self.hire
#       trainer_lead_interview_trainer = Trainer.all.find(self.trainer_id)
#       byebug
#       if is_hired == "N/A"
#         byebug
#         return trainer_lead_interview_trainer.update(occupied: true)
#         # return trainer_lead_interview_trainer
#       elsif is_hired == "yes"
#         trainer_lead_interview_trainer.update(occupied: false)
#         # return trainer_lead_interview_trainer
#       elsif is_hired == "no"
#         trainer_lead_interview_trainer.update(occupied: false)
#         # return trainer_lead_interview_trainer
#       end
#     end
#   end
#
#   def update_trainer_lead_hire
#     if self.hire == "N/A"
#       "N/A"
#     elsif self.hire.downcase == "yes"
#       # self.update(trainer_id: nil)
#       self.trainer_lead.update(hire: "yes")
#     elsif self.hire.downcase == "no"
#       # self.update(trainer_id: nil)
#       self.trainer_lead.update(hire: "no")
#     end
#   end
#
#   def check_trainers
#     Trainer.all.map do |trainer|
#       if trainer.trainer_lead_interviews.length == 0 && trainer.company_lead_interviews.length == 0 && trainer.occupied == false
#         trainer
#       elsif trainer.trainer_lead_interviews.length > 0 || trainer.company_lead_interviews.length > 0 && trainer.occupied == true
#         trainer
#       elsif trainer.trainer_lead_interviews.length == 0 && trainer.company_lead_interviews.length == 0 && trainer.occupied == true
#         byebug
#         trainer.update(occupied: false)
#       elsif trainer.trainer_lead_interviews.length > 0 || trainer.company_lead_interviews.length > 0 && trainer.occupied == false
#         byebug
#         trainer.update(occupied: true)
#       end
#     end
#   end
#
end
