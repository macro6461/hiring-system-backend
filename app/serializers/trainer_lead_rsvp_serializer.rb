class TrainerLeadRsvpSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :end_date, :description, :location, :trainer_lead_id, :checked_in, :event_id, :trainer_id

  belongs_to :event
  belongs_to :trainer_lead

end
