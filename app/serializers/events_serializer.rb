class EventsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :end_date, :location, :rsvps

  has_many :company_lead_rsvps
  has_many :trainer_lead_rsvps
  has_many :rsvps

  def rsvps
    object.company_lead_rsvps.length + object.trainer_lead_rsvps.length
  end


end
