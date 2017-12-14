class TrainerLeadInterview < ApplicationRecord

  belongs_to :interview
  belongs_to :trainer_lead
  has_one :trainer

end
