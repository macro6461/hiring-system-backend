class CompanyLeadRsvp < ApplicationRecord

  belongs_to :company_lead
  belongs_to :event
  has_one :company_lead_rsvp_ticket

  # after_initialize :init_company_lead_rsvp_ticket
  after_save :create_or_destroy_company_lead_rsvp_ticket

  def create_or_destroy_company_lead_rsvp_ticket
    # when company lead checks in (changes value of company_lead_rsvp.checked_in to true) destroy ticket (barcode can't be scanned)
    if !self.checked_in

      rsvp_ticket = CompanyLeadRsvpTicket.create(title: self.title, date: self.date, description: self.description, location: self.location, company_lead_id: self.company_lead_id, company_lead_rsvp_id: self.id, confirmation: (20 + Random.rand(11100000)), scanned: self.checked_in)
      # rsvp_ticket.update(barcode: (RQRCode::QRCode.new(rsvp_ticket.provisioning_uri("hiring-system-backend"), :size => 7, :level => :h )))
    elsif self.checked_in
    
      self.company_lead_rsvp_ticket.destroy()
    end
  end

end
