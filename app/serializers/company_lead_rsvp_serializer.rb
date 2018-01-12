class CompanyLeadRsvpSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :end_date, :description, :location, :company_lead_id, :checked_in, :event_id

  # belongs_to :event

end
