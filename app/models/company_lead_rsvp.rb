class CompanyLeadRsvp < ApplicationRecord

  belongs_to :company_lead
  belongs_to :event
  has_one :company_lead_rsvp_ticket

  # after_initialize :init_company_lead_rsvp_ticket
  after_save :create_or_destroy_company_lead_rsvp_ticket

  def create_or_destroy_company_lead_rsvp_ticket

    if self.checked_in == true

      self.company_lead_rsvp_ticket.destroy()
    else
      
    # when company lead checks in (changes value of company_lead_rsvp.checked_in to true) destroy ticket (barcode can't be scanned)
      rsvp_ticket = CompanyLeadRsvpTicket.where(:company_lead_id=>self.company_lead_id, :event_id=>self.event_id).first_or_create do |ticket|
        ticket.title = self.title
        ticket.date = self.date
        ticket.description = self.description
        ticket.location = self.location
        ticket.company_lead_rsvp_id = self.id
        ticket.confirmation = (20 + Random.rand(11100000))

        ticket.scanned = self.checked_in
      end
      # rsvp_ticket.update(barcode: (RQRCode::QRCode.new(rsvp_ticket.provisioning_uri("hiring-system-backend"), :size => 7, :level => :h )))
    end
  end

end
